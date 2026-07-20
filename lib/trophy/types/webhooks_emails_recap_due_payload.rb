# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksEmailsRecapDuePayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :recap, -> { Trophy::Types::WebhooksEmailsRecapDuePayloadRecap }, optional: false, nullable: false
    end
  end
end
