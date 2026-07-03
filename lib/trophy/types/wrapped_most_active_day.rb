# frozen_string_literal: true

module Trophy
  module Types
    # The user's most active day during the year.
    class WrappedMostActiveDay < Internal::Types::Model
      field :metrics, -> { Internal::Types::Hash[String, Trophy::Types::WrappedMetric] }, optional: false, nullable: false

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::WrappedPoints] }, optional: false, nullable: false

      field :achievements, -> { Internal::Types::Array[Trophy::Types::UserAchievementResponse] }, optional: false, nullable: false

      field :leaderboards, -> { Internal::Types::Hash[String, Trophy::Types::UserLeaderboardResponse] }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false
    end
  end
end
