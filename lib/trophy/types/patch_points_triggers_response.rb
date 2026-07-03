# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated triggers and any issues encountered.
    class PatchPointsTriggersResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminPointsTrigger] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
