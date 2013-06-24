module Achiever
  class DefinitionDatumProvider
    def initialize
      @data = {}
    end

    def register(datum)
      raise ArgumentError unless datum.is_a?(DefinitionDatum)
      @data[datum.class] ||= {}
      @data[datum.class][datum.id] = datum
    end

    def get_all(type)
      map = @data[type] || {}
      map.values
    end

  end
end