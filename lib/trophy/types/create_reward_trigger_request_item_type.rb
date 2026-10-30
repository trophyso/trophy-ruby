# frozen_string_literal: true

module Trophy
  module Types
    module CreateRewardTriggerRequestItemType
      extend Trophy::Internal::Types::Enum

      METRIC = "metric"
      ACHIEVEMENT = "achievement"
      STREAK = "streak"
      LEADERBOARD = "leaderboard"
    end
  end
end
