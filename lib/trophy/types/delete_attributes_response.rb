# frozen_string_literal: true

module Trophy
  module Types
    # Response containing deleted attributes represented by ID and any per-item issues, including invalid or missing
    # attribute IDs.
    class DeleteAttributesResponse < Internal::Types::Model
      field :deleted, -> { Internal::Types::Array[Trophy::Types::DeletedResource] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
