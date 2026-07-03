# frozen_string_literal: true

module Trophy
  module Types
    class AchievementCompletionResponse < Internal::Types::Model
      field :completion_id, -> { String }, optional: false, nullable: false, api_name: "completionId"

      field :achievement, -> { Trophy::Types::UserAchievementResponse }, optional: false, nullable: false

      field :points, -> { Internal::Types::Hash[String, Trophy::Types::MetricEventPointsResponse] }, optional: false, nullable: false
    end
  end
end
