# frozen_string_literal: true

module Trophy
  module Types
    class RewardWebhookEvent < Internal::Types::Model
      field :type, -> { Trophy::Types::RewardWebhookEventType }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :reward, -> { Trophy::Types::RewardSummary }, optional: false, nullable: false

      field :redemption, -> { Trophy::Types::RewardWebhookEventRedemption }, optional: false, nullable: false
    end
  end
end
