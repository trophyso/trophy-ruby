# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksLeaderboardStartedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :leaderboard, -> { Trophy::Types::LeaderboardResponseWithRankings }, optional: false, nullable: false
    end
  end
end
