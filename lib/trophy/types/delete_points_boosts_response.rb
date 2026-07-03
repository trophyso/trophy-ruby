# frozen_string_literal: true

module Trophy
  module Types
    # Response containing the points boosts that were deleted and any per-item issues.
    class DeletePointsBoostsResponse < Internal::Types::Model
      field :deleted, -> { Internal::Types::Array[Trophy::Types::DeletedResource] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
