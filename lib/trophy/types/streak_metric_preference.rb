# frozen_string_literal: true

module Trophy
  module Types
    # Per-metric streak threshold override for a user.
    class StreakMetricPreference < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :threshold, -> { Integer }, optional: false, nullable: false
    end
  end
end
