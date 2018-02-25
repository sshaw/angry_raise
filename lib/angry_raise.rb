class String
  def !
    AngryRaise::String.new(to_s)
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
    elsif argz[0].is_a?(String)
      argz[0] = (!argz[0]).to_s
    elsif argz[0].is_a?(Exception)
      s = AngryRaise::String.new(argz[0].message)
      argz[0].__level.times { !s } if argz[0].__level
      argz[0].message.replace(s.to_s)
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

  class String < ::String
    def initialize(*argz)
      super(argz.shift.dup, *argz)
      @level = 1
    end

    def !
      @level += 1
      self
    end

    def to_s
      empty? ? super : ragify
    end

    alias to_str to_s

    def inspect
      empty? ? super : ragify.inspect
    end

    private

    def ragify
      # Use :+ to force String creation, otherwise we'd get a AngryRaise::String
      case @level
      when 1
        self + "!"
      when 2
        capitalize + "!!"
      when 3
        split(/(\s+)/).map(&:capitalize).join("") << "!!!"
      else
        upcase + "!" * @level
      end
    end
  end
end
