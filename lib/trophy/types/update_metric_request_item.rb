# frozen_string_literal: true

module Trophy
  module Types
    # A metric update object. `id` is required; `name`, `unitType`, and `units` are optional. `key` cannot be changed
    # through this endpoint.
    class UpdateMetricRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :unit_type, -> { Trophy::Types::UpdateMetricRequestItemUnitType }, optional: true, nullable: false, api_name: "unitType"

      field :units, -> { String }, optional: true, nullable: false
    end
  end
end
