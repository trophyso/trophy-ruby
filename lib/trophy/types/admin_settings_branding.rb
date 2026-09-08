# frozen_string_literal: true

module Trophy
  module Types
    # Organization branding settings.
    class AdminSettingsBranding < Internal::Types::Model
      field :app_name, -> { String }, optional: false, nullable: false, api_name: "appName"

      field :app_url, -> { String }, optional: false, nullable: false, api_name: "appUrl"

      field :brand_color, -> { String }, optional: false, nullable: false, api_name: "brandColor"

      field :font, -> { Trophy::Types::AdminFontFamily }, optional: false, nullable: false

      field :logo, -> { Trophy::Types::AdminSettingsBrandingLogo }, optional: true, nullable: false

      field :app_icon, -> { Trophy::Types::AdminSettingsBrandingAppIcon }, optional: true, nullable: false, api_name: "appIcon"
    end
  end
end
