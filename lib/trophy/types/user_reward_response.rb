# frozen_string_literal: true

module Trophy
  module Types
    class UserRewardResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :awarded_at, -> { String }, optional: false, nullable: false, api_name: "awardedAt"

      field :redeemed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :redeemed_at, -> { String }, optional: true, nullable: false, api_name: "redeemedAt"

      field :reward, -> { Trophy::Types::RewardSummary }, optional: false, nullable: false

      field :trigger, -> { Trophy::Types::UserRewardTrigger }, optional: true, nullable: false
    end
  end
end
