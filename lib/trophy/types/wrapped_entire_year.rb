# frozen_string_literal: true

module Trophy
  module Types
    # The user's activity data for the entire year.
    class WrappedEntireYear < Internal::Types::Model
      field :metrics, -> { Internal::Types::Hash[String, Trophy::Types::WrappedMetric] }, optional: false, nullable: false

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::WrappedPoints] }, optional: false, nullable: false

      field :achievements, -> { Internal::Types::Array[Trophy::Types::UserAchievementResponse] }, optional: false, nullable: false

      field :leaderboards, -> { Internal::Types::Hash[String, Trophy::Types::UserLeaderboardResponse] }, optional: false, nullable: false

      field :longest_streak, -> { Trophy::Types::WrappedStreak }, optional: false, nullable: false, api_name: "longestStreak"
    end
  end
end
