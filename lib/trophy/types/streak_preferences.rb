# frozen_string_literal: true

module Trophy
  module Types
    # Per-user streak configuration. Metric, evaluation mode, and days off overrides require streak customization to be
    # enabled in dashboard settings.
    class StreakPreferences < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :evaluation_mode, -> { Trophy::Types::StreakEvaluationModePreference }, optional: true, nullable: false, api_name: "evaluationMode"

      field :metrics, -> { Internal::Types::Array[Trophy::Types::StreakMetricPreference] }, optional: true, nullable: false

      field :days_off, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false, api_name: "daysOff"
    end
  end
end
