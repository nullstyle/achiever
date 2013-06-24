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

  end

end