# frozen_string_literal: true

module Trophy
  module Types
    class PointsRange < Internal::Types::Model
      field :from, -> { Integer }, optional: false, nullable: false

      field :to, -> { Integer }, optional: false, nullable: false

      field :users, -> { Integer }, optional: false, nullable: false
    end
  end
end
