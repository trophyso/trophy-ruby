# frozen_string_literal: true

module Trophy
  module Admin
    module ApplicationApiKeys
      module Types
        class ApplicationApiKeysDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
