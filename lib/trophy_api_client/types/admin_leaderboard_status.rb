# frozen_string_literal: true

module TrophyApiClient
  # The current user-facing status of the leaderboard.
  class AdminLeaderboardStatus
    INACTIVE = "inactive"
    ACTIVE = "active"
    SCHEDULED = "scheduled"
    FINISHED = "finished"
  end
end
