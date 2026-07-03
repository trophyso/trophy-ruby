# frozen_string_literal: true

module Trophy
  module Types
    class PointsSystemResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge_url, -> { String }, optional: true, nullable: false, api_name: "badgeUrl"

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"

      field :triggers, -> { Internal::Types::Array[Trophy::Types::PointsTrigger] }, optional: false, nullable: false
    end
  end
end
