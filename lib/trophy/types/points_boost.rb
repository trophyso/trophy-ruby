# frozen_string_literal: true

module Trophy
  module Types
    class PointsBoost < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::PointsBoostStatus }, optional: false, nullable: false

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :multiplier, -> { Integer }, optional: false, nullable: false

      field :rounding, -> { Trophy::Types::PointsBoostRounding }, optional: false, nullable: false
    end
  end
end
