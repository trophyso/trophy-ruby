# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created triggers and any per-item issues.
    class CreatePointsTriggersResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminPointsTrigger] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
