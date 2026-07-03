# frozen_string_literal: true

module Trophy
  module Types
    # Deprecated. Event attribute filter that must be met for this achievement to be completed. Only present if the
    # achievement has an event filter configured.
    class AchievementResponseEventAttribute < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
