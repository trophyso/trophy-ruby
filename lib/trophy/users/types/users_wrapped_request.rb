# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersWrappedRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :year, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
