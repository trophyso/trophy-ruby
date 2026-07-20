# frozen_string_literal: true

module Trophy
  module Types
    # Details about the reactivation message.
    class WebhooksEmailsReactivationDuePayloadReactivation < Internal::Types::Model
      field :message_number, -> { Integer }, optional: false, nullable: false, api_name: "messageNumber"

      field :days_since_last_active, -> { Integer }, optional: false, nullable: false, api_name: "daysSinceLastActive"
    end
  end
end
