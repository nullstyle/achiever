require 'ache'

module Ache
  class Runner
    def run
      
      dd = Achiever::DefineProvider.new

      dd.register Level.new(:name => "Introduction")
      dd.register Level.new(:name => "Rising Action")
      dd.register Level.new(:name => "Climax")
      dd.register Level.new(:name => "Denouement")

      dd.register Monster.new(:name => "Zombie")
      dd.register Monster.new(:name => "Dog")
      dd.register Monster.new(:name => "Human")

      dd.register MonsterKillQuantity.new(:count => 1)
      dd.register MonsterKillQuantity.new(:count => 5)
      dd.register MonsterKillQuantity.new(:count => 10)

      ac = Achiever::AchievementProvider.new

      ac.register GameCompleteAchievement
      ac.register PerfectLevelAchievement
      ac.register KillManyMonstersAchievement

      amd = Achiever::AchievementMetadataProvider.new(File.dirname(__FILE__) + "/metadata.yml")


      context = Achiever::Context.new(dd, ac, amd)

      ud = []
      ud << UserData.new("scott", [], [
        LevelClear.new(Level.new(:name => "Introduction"), 20.days.ago, 90),
        LevelClear.new(Level.new(:name => "Rising Action"), 10.days.ago, 90),
        LevelClear.new(Level.new(:name => "Climax"), 10.days.ago, 50),
        LevelClear.new(Level.new(:name => "Denouement"), 1.day.ago, 90),
      ])

      ud << UserData.new("tito", [], [
        LevelClear.new(Level.new(:name => "Introduction"), 20.days.ago, 100),
        LevelClear.new(Level.new(:name => "Rising Action"), 10.days.ago, 100),
        LevelClear.new(Level.new(:name => "Climax"), 10.days.ago, 50),
      ])


      Achiever.run(context, ud) # => spits out a map of users to unlocks
    end
  end
end

if __FILE__ == $0
  Ache::Runner.new.run
end
