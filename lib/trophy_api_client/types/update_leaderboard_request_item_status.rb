# frozen_string_literal: true

module TrophyApiClient
  # The target user-facing status. `scheduled` activates a leaderboard whose start
  #  date is in the future. `finished` behaves like the dashboard finish action.
  class UpdateLeaderboardRequestItemStatus
    INACTIVE = "inactive"
    ACTIVE = "active"
    SCHEDULED = "scheduled"
    FINISHED = "finished"
  end
end
