# frozen_string_literal: true

module Trophy
  module Admin
    module Settings
      module Types
        class UpdateAdminSettingsRequest < Internal::Types::Model
          field :branding, -> { Trophy::Types::UpdateAdminSettingsBranding }, optional: true, nullable: false

          field :experimentation, -> { Trophy::Types::UpdateAdminSettingsExperimentation }, optional: true, nullable: false

          field :aggregation_period, -> { Trophy::Types::AdminAggregationPeriod }, optional: true, nullable: false, api_name: "aggregationPeriod"
        end
      end
    end
  end
end
