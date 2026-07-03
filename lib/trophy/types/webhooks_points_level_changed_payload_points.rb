# frozen_string_literal: true

module Trophy
  module Types
    # The points system in which the level changed.
    class WebhooksPointsLevelChangedPayloadPoints < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge_url, -> { String }, optional: true, nullable: false, api_name: "badgeUrl"

      field :max_points, -> { Integer }, optional: true, nullable: false, api_name: "maxPoints"

      field :total, -> { Integer }, optional: false, nullable: false
    end
  end
end
