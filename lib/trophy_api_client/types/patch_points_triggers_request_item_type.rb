# frozen_string_literal: true

module TrophyApiClient
  # Updated trigger type. Can only be changed when the trigger is inactive. Required
  #  fields for the new type must be provided.
  class PatchPointsTriggersRequestItemType
    METRIC = "metric"
    ACHIEVEMENT = "achievement"
    STREAK = "streak"
    TIME = "time"
    USER_CREATION = "user_creation"
  end
end
