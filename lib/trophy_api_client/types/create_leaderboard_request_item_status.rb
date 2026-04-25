# frozen_string_literal: true

module TrophyApiClient
  # The initial user-facing status. Defaults to `inactive`. Use `scheduled` for
  #  leaderboards that should be active in the future and `finished` only when
  #  creating a leaderboard with an end date in the past.
  class CreateLeaderboardRequestItemStatus
    INACTIVE = "inactive"
    ACTIVE = "active"
    SCHEDULED = "scheduled"
    FINISHED = "finished"
  end
end
