# frozen_string_literal: true

module Trophy
  module Admin
    module Tenants
      module Types
        class TenantsDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
