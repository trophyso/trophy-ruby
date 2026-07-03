# frozen_string_literal: true

module Trophy
  module Types
    class WebhooksLeaderboardRankChangedPayload < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :user, -> { Trophy::Types::User }, optional: false, nullable: false

      field :leaderboard, -> { Trophy::Types::WebhookUserLeaderboardResponse }, optional: false, nullable: false
    end
  end
end
