# frozen_string_literal: true

module Trophy
  module Types
    # A points boost as returned from admin endpoints.
    class AdminPointsBoost < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminPointsBoostStatus }, optional: false, nullable: false

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :multiplier, -> { Integer }, optional: false, nullable: false

      field :rounding, -> { Trophy::Types::AdminPointsBoostRounding }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::AdminPointsBoostUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"
    end
  end
end
