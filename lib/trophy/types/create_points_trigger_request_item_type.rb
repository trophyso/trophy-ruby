# frozen_string_literal: true

module Trophy
  module Types
    module CreatePointsTriggerRequestItemType
      extend Trophy::Internal::Types::Enum

      METRIC = "metric"
      ACHIEVEMENT = "achievement"
      STREAK = "streak"
      TIME = "time"
      USER_CREATION = "user_creation"
    end
  end
end
