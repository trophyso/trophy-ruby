# frozen_string_literal: true

module Trophy
  module Types
    # A tenant in a multi-tenant environment.
    class AdminTenant < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminTenantStatus }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :updated, -> { String }, optional: false, nullable: false
    end
  end
end
