module Achiever
  class DefineProvider
    def initialize
      @data = {}
    end

    def register(define)
      raise ArgumentError unless define.is_a?(Define)
      @data[define.class] ||= {}
      @data[define.class][define.id] = define
    end

    def get_all(type)
      map = @data[type] || {}
      map.values
    end

  end
end