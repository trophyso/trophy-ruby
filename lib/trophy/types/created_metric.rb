# frozen_string_literal: true

module Trophy
  module Types
    # A successfully created metric returned from the create endpoint.
    class CreatedMetric < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :unit_type, -> { Trophy::Types::CreatedMetricUnitType }, optional: false, nullable: false, api_name: "unitType"

      field :units, -> { String }, optional: false, nullable: false
    end
  end
end
