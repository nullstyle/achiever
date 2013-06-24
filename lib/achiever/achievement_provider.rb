require 'set'

module Achiever
  class AchievementProvider

    def initialize
      @achievement_classes = Set.new
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
      defp      = context.define_provider
      data     = ach_class.define_types.map{|klass| defp.get_all klass}
      expanded = data.first.product(*data.drop(1))

      expanded.map do |defines|
        ach_class.new defines, context
      end
    end

  end
end