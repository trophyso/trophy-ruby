# frozen_string_literal: true

module Trophy
  module Types
    # The trigger that awarded the reward, as it is configured now. Only the fields for the trigger's current type are
    # included.
    class UserRewardTrigger < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::UserRewardTriggerType }, optional: false, nullable: false

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length_threshold, -> { Integer }, optional: true, nullable: false, api_name: "streakLengthThreshold"

      field :leaderboard_id, -> { String }, optional: true, nullable: false, api_name: "leaderboardId"

      field :rank, -> { Integer }, optional: true, nullable: false
    end
  end
end
