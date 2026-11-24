# frozen_string_literal: true

module Trophy
  module Types
    module GoalCompletion
      extend Trophy::Internal::Types::Enum

      MANUAL = "manual"
      NONE = "none"
      METRIC = "metric"
    end
  end
end
