# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksPointsLevelChangedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :points, -> { Trophy::Types::WebhooksPointsLevelChangedPayloadPoints }, optional: false, nullable: false

      field :previous_level, -> { Trophy::Types::PointsLevel }, optional: true, nullable: false, api_name: "previousLevel"

      field :new_level, -> { Trophy::Types::PointsLevel }, optional: true, nullable: false, api_name: "newLevel"
    end
  end
end
