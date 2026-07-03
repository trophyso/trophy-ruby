# frozen_string_literal: true

module Trophy
  module Types
    # A points level to create.
    class CreatePointsLevelRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :points, -> { Integer }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::CreatePointsLevelRequestItemBadge }, optional: true, nullable: false
    end
  end
end
