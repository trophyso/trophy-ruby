# frozen_string_literal: true

module Trophy
  module Types
    class PointsAward < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :awarded, -> { Integer }, optional: true, nullable: false

      field :date, -> { String }, optional: true, nullable: false

      field :total, -> { Integer }, optional: true, nullable: false

      field :trigger, -> { Trophy::Types::PointsTrigger }, optional: true, nullable: false

      field :boosts, -> { Internal::Types::Array[Trophy::Types::PointsBoost] }, optional: true, nullable: false
    end
  end
end
