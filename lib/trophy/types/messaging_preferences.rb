# frozen_string_literal: true

module Trophy
  module Types
    # The user's agentic messaging preferences: the channels its messages may use, and how many and what kinds of
    # messages they want.
    class MessagingPreferences < Internal::Types::Model
      field :channels, -> { Internal::Types::Array[Trophy::Types::NotificationChannel] }, optional: true, nullable: false

      field :temperature, -> { Integer }, optional: true, nullable: false
    end
  end
end
