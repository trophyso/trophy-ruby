# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersPointsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :key, -> { String }, optional: false, nullable: false

        field :awards, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
