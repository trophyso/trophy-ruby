# frozen_string_literal: true

module Trophy
  module Metrics
    module Types
      class MetricsEventRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

        field :user, -> { Trophy::Types::UpsertedUser }, optional: false, nullable: false

        field :value, -> { Integer }, optional: false, nullable: false

        field :attributes, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
