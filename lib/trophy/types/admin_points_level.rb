# frozen_string_literal: true

module Trophy
  module Types
    # A points level as returned from admin endpoints.
    class AdminPointsLevel < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :points, -> { Integer }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :badge, -> { Trophy::Types::AdminPointsLevelBadge }, optional: true, nullable: false
    end
  end
end
