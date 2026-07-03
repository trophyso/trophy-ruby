# frozen_string_literal: true

module Trophy
  module Types
    # An attribute to create.
    class CreateAttributeRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::CreateAttributeRequestItemType }, optional: false, nullable: false
    end
  end
end
