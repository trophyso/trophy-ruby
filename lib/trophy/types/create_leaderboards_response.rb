# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created leaderboards and any per-item issues.
    class CreateLeaderboardsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminLeaderboard] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
