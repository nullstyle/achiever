module Ache
  class KillManyMonstersAchievement < Achiever::ParameterizedAchievement

    expands_with Monster
    expands_with MonsterKillQuantity
    
    def unlocks_for_user_data(user_data)
      [] #TODO
    end
  end
end