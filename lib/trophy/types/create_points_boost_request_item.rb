# frozen_string_literal: true

module Trophy
  module Types
    # A points boost to create. May optionally target a specific user via `userId` or filter by user attributes via
    # `userAttributes`. These two fields are mutually exclusive.
    class CreatePointsBoostRequestItem < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

      field :name, -> { String }, optional: false, nullable: false

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :multiplier, -> { Integer }, optional: false, nullable: false

      field :rounding, -> { Trophy::Types::CreatePointsBoostRequestItemRounding }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::CreatePointsBoostRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"
    end
  end
end
