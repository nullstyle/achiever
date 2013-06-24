module Ache
  class MonsterKillQuantity
    include Achiever::Define
    
    attribute :count, Integer

    def id
      # justify it right so we can get good sortng
      # in the metadata file
      count.to_s.rjust(5, "0")
    end
  end
end