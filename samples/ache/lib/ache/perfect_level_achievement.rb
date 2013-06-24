module Ache
  class PerfectLevelAchievement < Achiever::Achievement

    def unlocks_for_user_data(user_data)
      unlocks = []
      
      perfect_levels = user_data.level_clears.select{|lc| lc.remaining_health == 100}

      perfect_levels.each do |lc|
        unlocks << Achiever::Unlock.new(user_data.user, self.full_id, lc.created_at)
      end

      unlocks
    end
  end
end