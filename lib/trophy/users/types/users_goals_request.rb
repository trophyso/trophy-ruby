# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersGoalsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :status, -> { Trophy::Types::GoalStatus }, optional: true, nullable: false

        field :skip, -> { Integer }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
