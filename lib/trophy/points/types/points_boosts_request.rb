# frozen_string_literal: true

module Trophy
  module Points
    module Types
      class PointsBoostsRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :include_finished, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeFinished"
      end
    end
  end
end
