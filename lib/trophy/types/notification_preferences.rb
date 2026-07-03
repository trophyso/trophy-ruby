# frozen_string_literal: true

module Trophy
  module Types
    # Notification preferences for each notification type.
    class NotificationPreferences < Internal::Types::Model
      field :achievement_completed, -> { Internal::Types::Array[Trophy::Types::NotificationChannel] }, optional: true, nullable: false

      field :recap, -> { Internal::Types::Array[Trophy::Types::NotificationChannel] }, optional: true, nullable: false

      field :reactivation, -> { Internal::Types::Array[Trophy::Types::NotificationChannel] }, optional: true, nullable: false

      field :streak_reminder, -> { Internal::Types::Array[Trophy::Types::NotificationChannel] }, optional: true, nullable: false
    end
  end
end
