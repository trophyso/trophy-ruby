# frozen_string_literal: true

module Trophy
  module Types
    # Activity data for a specific period (day, week, month, or year).
    class WrappedActivityPeriod < Internal::Types::Model
      field :metrics, -> { Internal::Types::Hash[String, Trophy::Types::WrappedMetric] }, optional: false, nullable: false

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::WrappedPoints] }, optional: false, nullable: false

      field :achievements, -> { Internal::Types::Array[Trophy::Types::UserAchievementResponse] }, optional: false, nullable: false

      field :leaderboards, -> { Internal::Types::Hash[String, Trophy::Types::UserLeaderboardResponse] }, optional: false, nullable: false
    end
  end
end
