# frozen_string_literal: true

module Trophy
  module Leaderboards
    module Types
      module LeaderboardsAllResponseItemStatus
        extend Trophy::Internal::Types::Enum

        ACTIVE = "active"
        SCHEDULED = "scheduled"
        FINISHED = "finished"
      end
    end
  end
end
