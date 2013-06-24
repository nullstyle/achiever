require 'virtus'
require 'active_support/concern'
    
module Achiever
  module DefinitionDatum
    extend ActiveSupport::Concern

    included do |base|
      base.send :include, Virtus::ValueObject
    end

    attr_reader :type
    attr_reader :id

    def type
      self.class.name
    end

    def id
      raise NotImplementedError, "implement in including class"
    end

  end
end