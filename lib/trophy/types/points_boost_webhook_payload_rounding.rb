# frozen_string_literal: true

module Trophy
  module Types
    module PointsBoostWebhookPayloadRounding
      extend Trophy::Internal::Types::Enum

      DOWN = "down"
      UP = "up"
      NEAREST = "nearest"
    end
  end
end
