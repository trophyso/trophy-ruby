# frozen_string_literal: true

module Trophy
  module Types
    # A points system returned from the creation endpoint. Extends AdminPointsSystem with optional sub-entity arrays
    # that are present when those sub-entities were included in the creation request.
    class CreatedAdminPointsSystem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminPointsSystemStatus }, optional: false, nullable: false

      field :badge, -> { Trophy::Types::AdminPointsSystemBadge }, optional: true, nullable: false

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"

      field :levels, -> { Internal::Types::Array[Trophy::Types::AdminPointsLevel] }, optional: true, nullable: false

      field :boosts, -> { Internal::Types::Array[Trophy::Types::AdminPointsBoost] }, optional: true, nullable: false

      field :triggers, -> { Internal::Types::Array[Trophy::Types::AdminPointsTrigger] }, optional: true, nullable: false
    end
  end
end
