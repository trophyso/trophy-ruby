# frozen_string_literal: true

module Trophy
  module Types
    class PatchPointsLevelsRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :points, -> { Integer }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::PatchPointsLevelsRequestItemBadge }, optional: true, nullable: false
    end
  end
end
