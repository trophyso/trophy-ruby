# frozen_string_literal: true

module Trophy
  module Types
    # Points boost payload sent in points.boost_started and points.boost_finished webhook events.
    class PointsBoostWebhookPayload < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::PointsBoostWebhookPayloadStatus }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

      field :points_system_id, -> { String }, optional: false, nullable: false, api_name: "pointsSystemId"

      field :points_system_key, -> { String }, optional: false, nullable: false, api_name: "pointsSystemKey"

      field :points_system_name, -> { String }, optional: false, nullable: false, api_name: "pointsSystemName"

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :multiplier, -> { Integer }, optional: false, nullable: false

      field :rounding, -> { Trophy::Types::PointsBoostWebhookPayloadRounding }, optional: false, nullable: false
    end
  end
end
