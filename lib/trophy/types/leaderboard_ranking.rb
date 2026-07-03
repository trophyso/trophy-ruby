# frozen_string_literal: true

module Trophy
  module Types
    # A user's ranking in a leaderboard.
    class LeaderboardRanking < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"

      field :user_name, -> { String }, optional: true, nullable: false, api_name: "userName"

      field :rank, -> { Integer }, optional: false, nullable: false

      field :value, -> { Integer }, optional: false, nullable: false
    end
  end
end
