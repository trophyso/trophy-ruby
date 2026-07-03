# frozen_string_literal: true

module Trophy
  module Admin
    module Attributes
      module Types
        class AttributesDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
