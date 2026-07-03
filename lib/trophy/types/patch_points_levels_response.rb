# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated levels and any issues encountered.
    class PatchPointsLevelsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminPointsLevel] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
