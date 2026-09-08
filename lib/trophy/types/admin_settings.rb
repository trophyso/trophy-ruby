# frozen_string_literal: true

module Trophy
  module Types
    # The organization's branding, experimentation, and aggregation settings.
    class AdminSettings < Internal::Types::Model
      field :branding, -> { Trophy::Types::AdminSettingsBranding }, optional: false, nullable: false

      field :experimentation, -> { Trophy::Types::AdminSettingsExperimentation }, optional: false, nullable: false

      field :aggregation_period, -> { Trophy::Types::AdminAggregationPeriod }, optional: false, nullable: false, api_name: "aggregationPeriod"
    end
  end
end
