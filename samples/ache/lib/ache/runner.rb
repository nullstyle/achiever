require 'ache'

module Ache
  class Runner
    def run

      ctx = Achiever::Context.new(File.dirname(__FILE__) + "/metadata.yml")

      ctx.add_define Level.new(:name => "Introduction")
      ctx.add_define Level.new(:name => "Rising Action")
      ctx.add_define Level.new(:name => "Climax")
      ctx.add_define Level.new(:name => "Denouement")

      ctx.add_define Monster.new(:name => "Zombie")
      ctx.add_define Monster.new(:name => "Dog")
      ctx.add_define Monster.new(:name => "Human")

      ctx.add_define MonsterKillQuantity.new(:count => 1)
      ctx.add_define MonsterKillQuantity.new(:count => 5)
      ctx.add_define MonsterKillQuantity.new(:count => 10)


      ctx.add_achievement GameCompleteAchievement
      ctx.add_achievement PerfectLevelAchievement
      ctx.add_achievement KillManyMonstersAchievement


      ud = []
      ud << s = UserData.new("scott")
      s.level_clears << LevelClear.new(Level.new(:name => "Introduction"), 20.days.ago, 90)
      s.level_clears << LevelClear.new(Level.new(:name => "Rising Action"), 10.days.ago, 90)
      s.level_clears << LevelClear.new(Level.new(:name => "Climax"), 10.days.ago, 50)
      s.level_clears << LevelClear.new(Level.new(:name => "Denouement"), 1.day.ago, 90)
      

      ud << t = UserData.new("tito")
      t.level_clears << LevelClear.new(Level.new(:name => "Introduction"), 20.days.ago, 100)
      t.level_clears << LevelClear.new(Level.new(:name => "Rising Action"), 10.days.ago, 100)
      t.level_clears << LevelClear.new(Level.new(:name => "Climax"), 10.days.ago, 50)
      

      Achiever.run(ctx, ud) # => spits out a map of users to unlocks
    end
  end
end

if __FILE__ == $0
  Ache::Runner.new.run
end
