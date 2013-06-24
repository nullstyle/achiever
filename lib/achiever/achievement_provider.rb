module Achiever
  class AchievementProvider

    def initialize
      @achievement_classes = []
    end

    def register(achievement_class)
      @achievement_classes << achievement_class
    end

    def expand(context)

      @achievement_classes.map do |ach_class|
        if ach_class < ParameterizedAchievement
          expanded_parameterized_achievement ach_class, context
        else
          ach_class.new(context)
        end
      end.flatten
    end

    private

    def expanded_parameterized_achievement(ach_class, context)
      ddp      = context.definition_datum_provider
      data     = ach_class.definition_datum_types.map{|klass| ddp.get_all klass}
      expanded = data.first.product(*data.drop(1))

      expanded.map do |definition_data|
        ach_class.new definition_data, context
      end
    end

  end
end