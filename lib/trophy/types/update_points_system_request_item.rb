# frozen_string_literal: true

module Trophy
  module Types
    # A points system update object. Only id is required; all other fields are optional.
    class UpdatePointsSystemRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::UpdatePointsSystemRequestItemBadge }, optional: true, nullable: false

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"
    end
  end
end
