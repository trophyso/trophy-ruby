# frozen_string_literal: true

module Trophy
  module Types
    # An attribute returned from the admin attributes endpoints.
    class AdminAttribute < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::AdminAttributeType }, optional: false, nullable: false
    end
  end
end
