# frozen_string_literal: true

module TrophyApiClient
  # How often the leaderboard repeats. Omit for a non-recurring leaderboard. Streak
  #  leaderboards cannot repeat.
  class CreateLeaderboardRequestItemRunUnit
    DAY = "day"
    MONTH = "month"
    YEAR = "year"
  end
end
