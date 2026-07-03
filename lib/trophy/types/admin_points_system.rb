# frozen_string_literal: true

module Trophy
  module Types
    # A points system returned from the admin points systems endpoints.
    class AdminPointsSystem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminPointsSystemStatus }, optional: false, nullable: false

      field :badge, -> { Trophy::Types::AdminPointsSystemBadge }, optional: true, nullable: false

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"
    end
  end
end
