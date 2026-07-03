# frozen_string_literal: true

module Trophy
  module Types
    # A deleted resource represented by ID.
    class DeletedResource < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
