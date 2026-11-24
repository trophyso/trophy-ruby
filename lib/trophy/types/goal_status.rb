# frozen_string_literal: true

module Trophy
  module Types
    module GoalStatus
      extend Trophy::Internal::Types::Enum

      ACTIVE = "active"
      COMPLETED = "completed"
      MISSED = "missed"
      ENDED = "ended"
    end
  end
end
