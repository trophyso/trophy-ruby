# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated points systems and any per-item issues.
    class UpdatePointsSystemsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminPointsSystem] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
