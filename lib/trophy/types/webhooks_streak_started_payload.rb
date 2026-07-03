# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksStreakStartedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :streak, -> { Trophy::Types::BaseStreakResponse }, optional: false, nullable: false
    end
  end
end
