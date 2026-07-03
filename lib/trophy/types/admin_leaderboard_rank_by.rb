# frozen_string_literal: true

module Trophy
  module Types
    module AdminLeaderboardRankBy
      extend Trophy::Internal::Types::Enum

      METRIC = "metric"
      STREAK = "streak"
      POINTS = "points"
    end
  end
end
