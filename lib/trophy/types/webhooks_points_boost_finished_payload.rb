# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksPointsBoostFinishedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :boost, -> { Trophy::Types::PointsBoostWebhookPayload }, optional: false, nullable: false
    end
  end
end
