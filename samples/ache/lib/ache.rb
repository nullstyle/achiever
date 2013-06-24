require "ache/version"
require 'achiever'
require 'stringex'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'
require 'active_support/core_ext/numeric'

module Ache
  extend ActiveSupport::Autoload

  autoload :Monster
  autoload :Level
  autoload :MonsterKillQuantity

  autoload :MonsterKilled # killed x number of monsters
  autoload :LevelCompleteAchievement # completed a level

  autoload :GameCompleteAchievement # beat all levels
  autoload :KillManyMonstersAchievement # kill 1000 monsters, regardless of type
  autoload :PerfectLevelAchievement # finish level without damage

  autoload :UserData
  autoload :LevelClear
  autoload :Kill


  autoload :Runner


end
