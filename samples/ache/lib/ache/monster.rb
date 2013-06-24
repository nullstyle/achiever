module Ache
  class Monster
    include Achiever::Define

    attribute :name, String


    def id
      self.name.to_url
    end
  end
end