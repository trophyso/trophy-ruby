# frozen_string_literal: true

module Trophy
  module Types
    # A metric to create.
    class CreateMetricRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :unit_type, -> { Trophy::Types::CreateMetricRequestItemUnitType }, optional: true, nullable: false, api_name: "unitType"

      field :units, -> { String }, optional: true, nullable: false
    end
  end
end
