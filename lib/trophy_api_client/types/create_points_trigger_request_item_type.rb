# frozen_string_literal: true

module TrophyApiClient
  # The type of trigger.
  class CreatePointsTriggerRequestItemType
    METRIC = "metric"
    ACHIEVEMENT = "achievement"
    STREAK = "streak"
    TIME = "time"
    USER_CREATION = "user_creation"
  end
end
