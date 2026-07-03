# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created levels and any per-item issues.
    class CreatePointsLevelsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminPointsLevel] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
