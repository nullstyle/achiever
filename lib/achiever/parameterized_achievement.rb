require 'active_support/core_ext/class/attribute'
module Achiever

  class ParameterizedAchievement < Achievement

    class_attribute :definition_datum_types
    
    def self.expands_with(klass)
      raise ArgumentError unless klass < DefinitionDatum

      self.definition_datum_types ||= []
      self.definition_datum_types << klass

      class_eval <<-EOS
        def #{klass.basename.underscore}
          @definition_data[#{klass.name}]
        end
      EOS
    end

    def initialize(definition_data, context)
      @definition_data = definition_data.index_by(&:class)
      super context
    end

    def id
      keys = @definition_data.keys.sort_by(&:name)
      @definition_data.values_at(*keys).map(&:id).join("/")
    end

  end
end