module Ache
  class GameCompleteAchievement < Achiever::Achievement
    
    def unlocks_for_user_data(user_data)
      unlocks = []
      levels_left = levels.dup

      # require 'pry'
      # binding.pry

      user_data.level_clears.each do |lc|
        deleted = levels_left.delete(lc.level)

        if deleted && levels_left.empty?
          unlocks << Achiever::Unlock.new(user_data.user, self.full_id, lc.created_at)
        end
      end

      unlocks
    end

    def levels
      @levels ||= @context.definition_datum_provider.get_all(Level)
    end
  end
end