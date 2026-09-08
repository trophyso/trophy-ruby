# frozen_string_literal: true

module Trophy
  module Types
    # The organization's streak configuration.
    class StreakSettings < Internal::Types::Model
      field :frequency, -> { Trophy::Types::AdminStreakFrequency }, optional: false, nullable: false

      field :evaluation_mode, -> { Trophy::Types::AdminStreakEvaluationMode }, optional: false, nullable: false, api_name: "evaluationMode"

      field :customization_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "customizationEnabled"

      field :days_off, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false, api_name: "daysOff"

      field :metrics, -> { Internal::Types::Array[Trophy::Types::StreakSettingsMetric] }, optional: false, nullable: false

      field :freezes, -> { Trophy::Types::StreakSettingsFreezes }, optional: true, nullable: false
    end
  end
end
