require 'yaml'
require 'active_support/core_ext/hash/keys'

module Achiever
  class AchievementMetadataProvider
    def initialize(file)
      @file = file
      @data = {}
      load
    end

    def load
      documents = YAML.load_documents(IO.read(@file))

      @data = {}
      documents.each do |d|
        d.each do |(full_id, value)|
          @data[full_id] = value.symbolize_keys
        end
      end
    end

    def save(achievements)
      # add entries for each expanded achievement

      achievements.each do |ach|
        @data[ach.full_id] ||= {
          name: nil,
          points: nil,
          icon: nil,
        }
      end

      keys = @data.keys.sort

      open(@file, "w") do |f|
        keys.each do |key|
          data = @data[key].stringify_keys
          f.puts YAML.dump(key => data)
        end
      end
    end
    

    def metadata_for(ach)
      @data[ach.full_id] || {}
    end

  end
end