# frozen_string_literal: true

module TrophyApiClient
  # Whether meeting any single metric threshold (`OR`) or all configured metric
  #  thresholds (`AND`) extends the user's streak. Matches the evaluation mode
  #  configured in dashboard streak settings.
  class StreakEvaluationModePreference
    OR = "OR"
    AND = "AND"
  end
end
