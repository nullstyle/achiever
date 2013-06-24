require 'active_support/core_ext/class/attribute'
module Achiever

  class ParameterizedAchievement < Achievement

    class_attribute :define_types
    
    def self.expands_with(klass)
      raise ArgumentError unless klass < Define

      self.define_types ||= []
      self.define_types << klass

      class_eval <<-EOS
        def #{klass.basename.underscore}
          @defines[#{klass.name}]
        end
      EOS
    end

    def initialize(defines, context)
      @defines = defines.index_by(&:class)
      super context
    end

    def id
      keys = @defines.keys.sort_by(&:name)
      @defines.values_at(*keys).map(&:id).join("/")
    end

  end
end