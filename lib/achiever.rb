require "achiever/version"
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/enumerable'
require 'awesome_print'

module Achiever
  extend ActiveSupport::Autoload

  require 'achiever/core_ext/class'

  autoload :Define
  autoload :DefineProvider
  
  autoload :Achievement
  autoload :ParameterizedAchievement
  autoload :AchievementProvider
  autoload :AchievementMetadataProvider

  autoload :Unlock

  autoload :Context


  def self.run(context, user_datas)
    achievement_provider          = context.achievement_provider
    define_provider               = context.define_provider
    achievement_metadata_provider = context.achievement_metadata_provider

    puts "expanding achievements"
    achievements = achievement_provider.expand(context)
    puts "... expanded out to #{achievements.length} achievements"
    result = {}

    achievement_metadata_provider.save(achievements)


    user_datas.each do |ud|
      result[ud.user] = []
      result[ud.user] = user_unlocks(achievements, ud)
    end

    puts
    puts "-- finished calculating all unlocks --"
    puts
    
    ap result
  end

  def self.user_unlocks(achievements, user_data)
    puts "calculating unlocks for #{user_data.user}"

    achievements.each_with_object([]) do |ach, result|
      next unless ach.valid?

      puts "... adding unlocks for #{ach.name}"
      result.concat ach.unlocks_for_user_data(user_data)
    end
  end
end
