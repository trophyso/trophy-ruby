# frozen_string_literal: true

module Trophy
  module Types
    # A user's year-in-review wrapped data including activity summaries, metrics, points, achievements, streaks, and
    # leaderboard rankings.
    class WrappedResponse < Internal::Types::Model
      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :activity, -> { Trophy::Types::WrappedActivity }, optional: false, nullable: false
    end
  end
end
