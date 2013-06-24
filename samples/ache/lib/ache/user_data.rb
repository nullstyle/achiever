module Ache
  class UserData
    attr_reader :user, :kills, :level_clears

    def initialize(user, kills, level_clears)
      @user         = user
      @kills        = kills
      @level_clears = level_clears
    end

  end
end