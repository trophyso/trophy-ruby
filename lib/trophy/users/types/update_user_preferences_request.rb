# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UpdateUserPreferencesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :notifications, -> { Trophy::Types::NotificationPreferences }, optional: true, nullable: false

        field :streak, -> { Trophy::Types::StreakPreferences }, optional: true, nullable: false
      end
    end
  end
end
