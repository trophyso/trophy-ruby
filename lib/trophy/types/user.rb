# frozen_string_literal: true

module Trophy
  module Types
    # A user of your application.
    class User < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :email, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :tz, -> { String }, optional: true, nullable: false

      field :sign_up_date, -> { String }, optional: true, nullable: false, api_name: "signUpDate"

      field :device_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "deviceTokens"

      field :subscribe_to_emails, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "subscribeToEmails"

      field :attributes, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :control, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :updated, -> { String }, optional: false, nullable: false
    end
  end
end
