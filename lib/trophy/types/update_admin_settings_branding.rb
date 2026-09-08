# frozen_string_literal: true

module Trophy
  module Types
    # Branding fields to update. Omitted fields stay as-is.
    class UpdateAdminSettingsBranding < Internal::Types::Model
      field :app_name, -> { String }, optional: true, nullable: false, api_name: "appName"

      field :app_url, -> { String }, optional: true, nullable: false, api_name: "appUrl"

      field :brand_color, -> { String }, optional: true, nullable: false, api_name: "brandColor"

      field :font, -> { Trophy::Types::AdminFontFamily }, optional: true, nullable: false

      field :logo, -> { Trophy::Types::UpdateAdminSettingsBrandingLogo }, optional: true, nullable: false

      field :app_icon, -> { Trophy::Types::UpdateAdminSettingsBrandingAppIcon }, optional: true, nullable: false, api_name: "appIcon"
    end
  end
end
