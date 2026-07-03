# frozen_string_literal: true

module Trophy
  module Types
    module LeaderboardResponseWithRankingsStatus
      extend Trophy::Internal::Types::Enum

      ACTIVE = "active"
      SCHEDULED = "scheduled"
      FINISHED = "finished"
    end
  end
end
