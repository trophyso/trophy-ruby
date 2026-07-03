# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersLeaderboardRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :key, -> { String }, optional: false, nullable: false

        field :run, -> { String }, optional: true, nullable: false

        field :num_events, -> { Integer }, optional: true, nullable: false, api_name: "numEvents"
      end
    end
  end
end
