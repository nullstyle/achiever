module Ache
  class Level
    include Achiever::Define

    attribute :name, String

    def id
      @name.to_url
    end
  end
end