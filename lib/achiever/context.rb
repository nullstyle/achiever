module Achiever
  class Context

    attr_reader :define_provider
    attr_reader :achievement_provider
    attr_reader :achievement_metadata_provider

    def initialize(metadata_path)
      @metadata_path        = metadata_path
      @define_provider      = DefineProvider.new
      @achievement_provider = AchievementProvider.new
      @achievement_metadata_provider = AchievementMetadataProvider.new(@metadata_path)
    end

    def add_define(define)
      self.define_provider.register(define)
    end

    def add_achievement(achievement)
      self.achievement_provider.register(achievement)
    end

  end

end