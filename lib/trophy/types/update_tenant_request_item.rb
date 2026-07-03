# frozen_string_literal: true

module Trophy
  module Types
    # A tenant to update.
    class UpdateTenantRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
