# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated leaderboards and any per-item issues identified by leaderboard ID.
    class UpdateLeaderboardsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminLeaderboard] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
