# frozen_string_literal: true

module Trophy
  module Types
    # Experimentation fields to update. Omitted fields stay as-is.
    class UpdateAdminSettingsExperimentation < Internal::Types::Model
      field :control_ratio, -> { Integer }, optional: true, nullable: false, api_name: "controlRatio"

      field :user_activation_window, -> { Integer }, optional: true, nullable: false, api_name: "userActivationWindow"
    end
  end
end
