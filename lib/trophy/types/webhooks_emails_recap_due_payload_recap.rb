# frozen_string_literal: true

module Trophy
  module Types
    # Details about the recap period.
    class WebhooksEmailsRecapDuePayloadRecap < Internal::Types::Model
      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: false, api_name: "periodEnd"
    end
  end
end
