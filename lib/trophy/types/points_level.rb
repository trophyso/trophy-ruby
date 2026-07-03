# frozen_string_literal: true

module Trophy
  module Types
    # A level within a points system.
    class PointsLevel < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :badge_url, -> { String }, optional: true, nullable: false, api_name: "badgeUrl"

      field :points, -> { Integer }, optional: false, nullable: false
    end
  end
end
