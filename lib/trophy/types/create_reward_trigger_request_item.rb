# frozen_string_literal: true

module Trophy
  module Types
    # A reward trigger to create.
    class CreateRewardTriggerRequestItem < Internal::Types::Model
      field :type, -> { Trophy::Types::CreateRewardTriggerRequestItemType }, optional: false, nullable: false

      field :status, -> { Trophy::Types::CreateRewardTriggerRequestItemStatus }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::CreateRewardTriggerRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::CreateRewardTriggerRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :leaderboard_id, -> { String }, optional: true, nullable: false, api_name: "leaderboardId"

      field :rank, -> { Integer }, optional: true, nullable: false
    end
  end
end
