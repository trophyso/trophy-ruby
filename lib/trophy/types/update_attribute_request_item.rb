# frozen_string_literal: true

module Trophy
  module Types
    # An attribute update object. `id` is required and `name` is optional. `key` and `type` cannot be changed through
    # this endpoint.
    class UpdateAttributeRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
