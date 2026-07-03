# frozen_string_literal: true

module Trophy
  module Types
    # Response containing deleted metrics represented by ID and any per-item issues, including invalid or missing metric
    # IDs.
    class DeleteMetricsResponse < Internal::Types::Model
      field :deleted, -> { Internal::Types::Array[Trophy::Types::DeletedResource] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
