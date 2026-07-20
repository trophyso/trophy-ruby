# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksEmailsStreakReminderDuePayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :streak, -> { Trophy::Types::StreakResponse }, optional: false, nullable: false
    end
  end
end
