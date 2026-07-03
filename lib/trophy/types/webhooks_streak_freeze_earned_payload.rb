# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksStreakFreezeEarnedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :earned, -> { Integer }, optional: false, nullable: false

      field :freezes, -> { Integer }, optional: false, nullable: false
    end
  end
end
