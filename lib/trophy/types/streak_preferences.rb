# frozen_string_literal: true

module Trophy
  module Types
    # Per-user streak configuration. Metric and evaluation mode overrides require streak customization to be enabled in
    # dashboard settings.
    class StreakPreferences < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :evaluation_mode, -> { Trophy::Types::StreakEvaluationModePreference }, optional: true, nullable: false, api_name: "evaluationMode"

      field :metrics, -> { Internal::Types::Array[Trophy::Types::StreakMetricPreference] }, optional: true, nullable: false
    end
  end
end
