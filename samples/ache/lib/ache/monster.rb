module Ache
  class Monster
    include Achiever::DefinitionDatum

    attribute :name, String


    def id
      self.name.to_url
    end
  end
end