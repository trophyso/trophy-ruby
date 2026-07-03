# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksPointsChangedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :points, -> { Trophy::Types::MetricEventPointsResponse }, optional: false, nullable: false
    end
  end
end
