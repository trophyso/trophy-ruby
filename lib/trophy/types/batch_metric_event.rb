# frozen_string_literal: true

module Trophy
  module Types
    # A metric event submitted as part of a batch. Same shape as a single metric event, with the metric key included in
    # the body.
    class BatchMetricEvent < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::BatchMetricEventUser }, optional: false, nullable: false

      field :value, -> { Integer }, optional: false, nullable: false

      field :attributes, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "idempotencyKey"
    end
  end
end
