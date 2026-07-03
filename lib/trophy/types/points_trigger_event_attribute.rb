# frozen_string_literal: true

module Trophy
  module Types
    # Deprecated. Event attribute filter that must be met for this trigger to award points. Only present if the trigger
    # has an event filter configured.
    class PointsTriggerEventAttribute < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
