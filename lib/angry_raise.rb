# coding: utf-8
# frozen_string_literal: true

class String
  def !
    AngryRaise::String.new(self)
  end
end

class Exception
  attr_reader :__level

  def !
    @__level ||= 0
    @__level += 1
    self
  end

  def self.!
    AngryRaise::Exception.new(self)
  end
end

module Kernel
  def raise!(*argz)
    if argz.size > 1
      s = AngryRaise::String.new(argz[1].to_s)
      argz[0].__level.times { !s }  if argz[0].is_a?(Exception)
      argz[1] = s.to_s
    elsif argz[0].is_a?(Exception)
      s = AngryRaise::String.new(argz[0].message)
      argz[0].__level.times { !s } if argz[0].__level
      argz[0].message.replace(s.to_s)
    else argz[0]
      argz[0] = argz[0].is_a?(AngryRaise::String) ? !argz[0] : AngryRaise::String.new(argz[0])
    end

    raise(*argz)
  end
end

module AngryRaise
  class Exception < ::Exception
    attr_reader :__level

    def initialize(target)
      @target = target
      @__level = 1
    end

    def !
      @__level += 1
      self
    end

    def exception(s)
      @target.exception(s)
    end
  end

  class String
    def initialize(str)
      @str = str.to_s
      @level = 1
    end

    def !
      @level += 1
      self
    end

    def to_s
      rageify
    end

    alias to_str to_s

    def inspect
      rageify.inspect
    end

    private

    def rageify
      return @str.dup if @str.strip.empty?

      s = case @level
      when 1
        @str + "!"
      when 2
        @str.capitalize << "!!"
      when 3
        @str.split(/(\s+)/).map(&:capitalize).join("") << "!!!"
      else
        @str.upcase << "!" * @level
      end

      # Should ENV be used too?
      s.prepend("¡" * @level) if defined?(I18n) && I18n.locale =~ /\Aes(?:_|\b)/
      s
    end
  end
end
