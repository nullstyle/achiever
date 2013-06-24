module Achiever
  class Achievement

    attr_reader :context
    attr_reader :name
    attr_reader :points 
    attr_reader :icon # symbolic names, maps into icon file

    def initialize(context)
      @context = context
      @name   = metadata[:name]
      @points = metadata[:points]
      @icon   = metadata[:icon]
    end


    # 
    # Returns an array of unlock objects that would be created from the provided user data
    def unlocks_from_user_data(user_data)
      raise NotImplementedError
    end

    def id
      "main"
    end

    def type
      self.class.name
    end

    def full_id
      [type, id].join("/")
    end

    def valid?
      @name.present? && @points.present?
    end

    def metadata
      @metadata ||= context.achievement_metadata_provider.metadata_for(self)
    end
  end

end