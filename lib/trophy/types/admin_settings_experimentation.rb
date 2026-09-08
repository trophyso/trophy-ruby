# frozen_string_literal: true

module Trophy
  module Types
    # Experimentation settings.
    class AdminSettingsExperimentation < Internal::Types::Model
      field :control_ratio, -> { Integer }, optional: false, nullable: false, api_name: "controlRatio"

      field :user_activation_window, -> { Integer }, optional: false, nullable: false, api_name: "userActivationWindow"
    end
  end
end
