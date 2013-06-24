module Ache
  class KillManyMonstersAchievement < Achiever::ParameterizedAchievement

    expands_with Monster
    expands_with MonsterKillQuantity
    
    def unlocks_for_user_data(user_data)
      monster_kills = user_data.kills.select{|k| k.monster == self.monster}

      if monster_kills.count >= kill_count
        triggering_kill = monster_kills[kill_count - 1]
        [Achiever::Unlock.new(user_data.user, self.full_id, triggering_kill.created_at)]
      else
        []
      end
    end

    def kill_count
      self.monster_kill_quantity.count
    end
  end
end