# frozen_string_literal: true

module TrophyApiClient
  # A type of notification that can be configured.
  class NotificationType
    ACHIEVEMENT_COMPLETED = "achievement_completed"
    RECAP = "recap"
    REACTIVATION = "reactivation"
    STREAK_REMINDER = "streak_reminder"
  end
end
