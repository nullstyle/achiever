module Ache
  class Level
    include Achiever::DefinitionDatum

    attribute :name, String

    def id
      @name.to_url
    end
  end
end