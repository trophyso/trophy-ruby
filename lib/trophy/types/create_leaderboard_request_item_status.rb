# frozen_string_literal: true

module Trophy
  module Types
    module CreateLeaderboardRequestItemStatus
      extend Trophy::Internal::Types::Enum

      INACTIVE = "inactive"
      ACTIVE = "active"
      SCHEDULED = "scheduled"
      FINISHED = "finished"
    end
  end
end
