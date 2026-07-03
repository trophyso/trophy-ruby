# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated metrics and any per-item issues identified by metric ID.
    class UpdateMetricsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::CreatedMetric] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
