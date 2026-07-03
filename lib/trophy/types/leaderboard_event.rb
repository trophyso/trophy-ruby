# frozen_string_literal: true

module Trophy
  module Types
    # A daily leaderboard snapshot entry representing the user's rank/value state and the previous persisted state.
    class LeaderboardEvent < Internal::Types::Model
      field :date, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :previous_rank, -> { Integer }, optional: true, nullable: false, api_name: "previousRank"

      field :rank, -> { Integer }, optional: true, nullable: false

      field :previous_value, -> { Integer }, optional: true, nullable: false, api_name: "previousValue"

      field :value, -> { Integer }, optional: true, nullable: false
    end
  end
end
