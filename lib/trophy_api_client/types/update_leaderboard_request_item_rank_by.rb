# frozen_string_literal: true

module TrophyApiClient
  # The updated ranking criterion. This can only be changed while the leaderboard is
  #  inactive.
  class UpdateLeaderboardRequestItemRankBy
    METRIC = "metric"
    STREAK = "streak"
    POINTS = "points"
  end
end
