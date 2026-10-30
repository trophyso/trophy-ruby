# frozen_string_literal: true

module Trophy
  module Types
    class RedeemRewardResponse < Internal::Types::Model
      field :reward, -> { Trophy::Types::RewardSummary }, optional: false, nullable: false

      field :redemptions, -> { Internal::Types::Array[Trophy::Types::RedeemedReward] }, optional: false, nullable: false

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::MetricEventPointsResponse] }, optional: true, nullable: false

      field :leaderboards, -> { Internal::Types::Hash[String, Trophy::Types::MetricEventLeaderboardResponse] }, optional: false, nullable: false
    end
  end
end
