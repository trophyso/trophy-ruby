# frozen_string_literal: true

module Trophy
  module Types
    class UpdateRewardTriggersRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::UpdateRewardTriggersRequestItemType }, optional: true, nullable: false

      field :status, -> { Trophy::Types::UpdateRewardTriggersRequestItemStatus }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::UpdateRewardTriggersRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::UpdateRewardTriggersRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :leaderboard_id, -> { String }, optional: true, nullable: false, api_name: "leaderboardId"

      field :rank, -> { Integer }, optional: true, nullable: false
    end
  end
end
