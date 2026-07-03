# frozen_string_literal: true

module Trophy
  module Types
    # A tenant to create.
    class CreateTenantRequestItem < Internal::Types::Model
      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
