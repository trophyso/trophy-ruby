# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created boosts and any issues encountered while creating points boosts.
    class CreatePointsBoostsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminPointsBoost] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
