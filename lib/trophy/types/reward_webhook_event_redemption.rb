# frozen_string_literal: true

module Trophy
  module Types
    class RewardWebhookEventRedemption < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :redeemed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :awarded_at, -> { String }, optional: false, nullable: false, api_name: "awardedAt"

      field :redeemed_at, -> { String }, optional: true, nullable: false, api_name: "redeemedAt"

      field :trigger, -> { Trophy::Types::UserRewardTrigger }, optional: true, nullable: false
    end
  end
end
