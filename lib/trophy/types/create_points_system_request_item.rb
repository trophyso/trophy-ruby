# frozen_string_literal: true

module Trophy
  module Types
    # A points system to create. Optionally include sub-entities.
    class CreatePointsSystemRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::CreatePointsSystemRequestItemBadge }, optional: true, nullable: false

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"

      field :levels, -> { Internal::Types::Array[Trophy::Types::CreatePointsLevelRequestItem] }, optional: true, nullable: false

      field :boosts, -> { Internal::Types::Array[Trophy::Types::CreatePointsBoostRequestItem] }, optional: true, nullable: false

      field :triggers, -> { Internal::Types::Array[Trophy::Types::CreatePointsTriggerRequestItem] }, optional: true, nullable: false
    end
  end
end
