# frozen_string_literal: true

module Trophy
  module Types
    module AchievementResponseTrigger
      extend Trophy::Internal::Types::Enum

      METRIC = "metric"
      STREAK = "streak"
      API = "api"
      ACHIEVEMENT = "achievement"
    end
  end
end
