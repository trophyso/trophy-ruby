# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksStreakFreezeConsumedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :consumed, -> { Integer }, optional: false, nullable: false

      field :freezes, -> { Integer }, optional: false, nullable: false
    end
  end
end
