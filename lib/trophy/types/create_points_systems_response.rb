# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created points systems and any per-item issues.
    class CreatePointsSystemsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::CreatedAdminPointsSystem] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
