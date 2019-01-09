#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'
require 'fileutils'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 250
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

# IRB.conf[:PROMPT][:CUSTOM] = "%N(%m):%03n:%i %~> ".tap {|s| def s.dup; gsub('%~', Dir.pwd); end }
# Do not use coloring for prompts because of weird bug in cursor positioning in IRB.
# \001 and \002 are special characters prcessed by readline, so the substring between them
# will not be counted in prompt length calculation.
# http://www.tek-tips.com/viewthread.cfm?qid=1560209&page=20
rvm_ruby_string = ENV["rvm_ruby_string"] || "#{RUBY_ENGINE rescue 'ruby'}-#{RUBY_VERSION}-#{(RUBY_PATCHLEVEL) ? "p#{RUBY_PATCHLEVEL}" : "r#{RUBY_REVISION}"}"
IRB.conf[:PROMPT][:DOTFILES] = {
  :PROMPT_I => "\001\e[34m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002 >> \001\e[0m\002",
  :PROMPT_S => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;32m\002%l>> \001\e[0m\002",
  :PROMPT_C => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002 .. \001\e[0m\002",
  :PROMPT_N => "\001\e[90m\002#{rvm_ruby_string}\001\e[0m\002\001\e[0;36m\002?.. \001\e[0m\002",
  :RETURN   => "\e[1;31m\342\206\222\e[0m %s\n"
}
if Readline::VERSION == 'EditLine wrapper'
  puts "\e[31mWARNING\e[0m: You ruby built with \e[35meditline\e[0m, instead of \e[35mreadline\e[0m, so it does not support" +
    "Unicode and ANSI chars in prompt.\n" +
    "Please re-build your Ruby with readline support (see http://bit.ly/dxQmvQ for details):
    \e[90mrvm install ree -C --with-readline-dir=`brew --prefix readline`\e[0m"
  IRB.conf[:PROMPT][:DOTFILES].each do |k, v|
    IRB.conf[:PROMPT][:DOTFILES][k] = v.gsub(%r{\001[^\002]*\002}, '')
  end
end
IRB.conf[:PROMPT_MODE] = :DOTFILES

# load-errors on pretty-print / ie / colorized
%w[
  pp
  ap
  interactive_editor
  wirble
].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

# ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

#Wirble.init
#Wirble.colorize
#colors = Wirble::Colorize.colors.merge({
#  :object_class => :purple,
#  :symbol => :purple,
#  :symbol_prefix => :purple
#})
#Wirble::Colorize.colors = colors

if ENV.include?('RAILS_ENV')
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
  end
end

IRB::Irb.class_eval do
  def output_value
    if defined? AwesomePrint
      ap @context.last_value
    else
      pp @context.last_value
    end
  end
end

class Object
  ANSI_BOLD  = "\033[1m"
  ANSI_RESET = "\033[0m"
  ANSI_LGRAY = "\033[0;37m"
  ANSI_GRAY  = "\033[1;30m"

  def pretty_methods(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item|
      print " #{ANSI_BOLD}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end

  def local_methods(include_superclasses = true)
    (self.methods - (include_superclasses ? Object.methods : obj.class.superclass.instance_methods)).sort
  end
  
  def local_readers(regex = nil)
    methods = local_methods.select do |name|
      arity = method(name).arity == 0
      match = regex ? name =~ regex : true
      arity && match
    end
    methods.each do |name|
      print name.to_s.rjust(20)
      print " : "
      begin
        puts send(name).to_s.truncate(80)
      rescue => e
        puts e.message
      end
    end
    methods.size
  end

  def ri(method = nil)
    unless method && method =~ /^[A-Z]/
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

module Kernel
  def copy(str)
    IO.popen('pbcopy', 'w') {|f| f << str.to_s }
    str
  end

  def paste
    `pbpaste`
  end
  
  def copy_history
    history = Readline::HISTORY.entries
    index = history.rindex("q") || -1
    content = history[(index + 1)..-2].join("\n")
    puts content
    copy content
  end
end

alias q exit

