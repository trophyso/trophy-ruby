# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Settings
        module Types
          class UpdateStreakSettingsRequest < Internal::Types::Model
            field :frequency, -> { Trophy::Types::AdminStreakFrequency }, optional: true, nullable: false

            field :evaluation_mode, -> { Trophy::Types::AdminStreakEvaluationMode }, optional: true, nullable: false, api_name: "evaluationMode"

            field :customization_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "customizationEnabled"

            field :days_off, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false, api_name: "daysOff"

            field :metrics, -> { Internal::Types::Array[Trophy::Types::StreakSettingsMetric] }, optional: true, nullable: false

            field :freezes, -> { Trophy::Types::UpdateStreakSettingsFreezes }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
