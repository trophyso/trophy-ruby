# frozen_string_literal: true

module Trophy
  module Types
    module LeaderboardResponseRankBy
      extend Trophy::Internal::Types::Enum

      POINTS = "points"
      STREAK = "streak"
      METRIC = "metric"
    end
  end
end
