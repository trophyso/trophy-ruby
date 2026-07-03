# frozen_string_literal: true

module Trophy
  module Users
    module Types
      module UsersMetricEventSummaryRequestAggregation
        extend Trophy::Internal::Types::Enum

        DAILY = "daily"
        WEEKLY = "weekly"
        MONTHLY = "monthly"
      end
    end
  end
end
