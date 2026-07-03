# frozen_string_literal: true

module Trophy
  module Types
    # A user's preferences.
    class UserPreferencesResponse < Internal::Types::Model
      field :notifications, -> { Trophy::Types::NotificationPreferences }, optional: false, nullable: false

      field :streak, -> { Trophy::Types::StreakPreferences }, optional: true, nullable: false
    end
  end
end
