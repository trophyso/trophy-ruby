# frozen_string_literal: true

module Trophy
  module Types
    # An object with editable user fields.
    class UpdatedUser < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :tz, -> { String }, optional: true, nullable: false

      field :sign_up_date, -> { String }, optional: true, nullable: false, api_name: "signUpDate"

      field :device_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "deviceTokens"

      field :subscribe_to_emails, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "subscribeToEmails"

      field :attributes, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
