# frozen_string_literal: true

module Trophy
  module Types
    class EventResponse < Internal::Types::Model
      field :event_id, -> { String }, optional: false, nullable: false, api_name: "eventId"

      field :metric_id, -> { String }, optional: false, nullable: false, api_name: "metricId"

      field :total, -> { Integer }, optional: false, nullable: false

      field :achievements, -> { Internal::Types::Array[Trophy::Types::UserAchievementResponse] }, optional: false, nullable: false

      field :current_streak, -> { Trophy::Types::MetricEventStreakResponse }, optional: false, nullable: false, api_name: "currentStreak"

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::MetricEventPointsResponse] }, optional: false, nullable: false

      field :leaderboards, -> { Internal::Types::Hash[String, Trophy::Types::MetricEventLeaderboardResponse] }, optional: false, nullable: false

      field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "idempotencyKey"

      field :idempotent_replayed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "idempotentReplayed"
    end
  end
end
