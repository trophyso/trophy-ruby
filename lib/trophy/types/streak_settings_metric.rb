# frozen_string_literal: true

module Trophy
  module Types
    # A metric that counts toward the organization streak.
    class StreakSettingsMetric < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :threshold, -> { Integer }, optional: false, nullable: false
    end
  end
end
