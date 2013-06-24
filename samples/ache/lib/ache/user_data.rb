module Ache
  class UserData
    attr_reader :user, :kills, :level_clears

    def initialize(user)
      @user         = user
      @kills        = []
      @level_clears = []
    end

  end
end