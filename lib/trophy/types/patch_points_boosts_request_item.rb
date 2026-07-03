# frozen_string_literal: true

module Trophy
  module Types
    class PatchPointsBoostsRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :multiplier, -> { Integer }, optional: true, nullable: false

      field :rounding, -> { Trophy::Types::PatchPointsBoostsRequestItemRounding }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::PatchPointsBoostsRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"
    end
  end
end
