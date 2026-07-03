# frozen_string_literal: true

module Trophy
  module Leaderboards
    module Types
      class LeaderboardsGetRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :run, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

        field :user_attributes, -> { String }, optional: true, nullable: false, api_name: "userAttributes"
      end
    end
  end
end
