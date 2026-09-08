# frozen_string_literal: true

module Trophy
  module Types
    module AdminStreakFrequency
      extend Trophy::Internal::Types::Enum

      DAILY = "daily"
      WEEKLY = "weekly"
      MONTHLY = "monthly"
    end
  end
end
