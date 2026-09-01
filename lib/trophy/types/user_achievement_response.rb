# frozen_string_literal: true

module Trophy
  module Types
    class UserAchievementResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :trigger, -> { Trophy::Types::AchievementResponseTrigger }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :badge_url, -> { String }, optional: true, nullable: false, api_name: "badgeUrl"

      field :key, -> { String }, optional: true, nullable: false

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :anniversary_years, -> { Integer }, optional: true, nullable: false, api_name: "anniversaryYears"

      field :achievement_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "achievementIds"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_value, -> { Integer }, optional: true, nullable: false, api_name: "metricValue"

      field :metric_name, -> { String }, optional: true, nullable: false, api_name: "metricName"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::AchievementResponseUserAttributesItem] }, optional: false, nullable: false, api_name: "userAttributes"

      field :event_attribute, -> { Trophy::Types::AchievementResponseEventAttribute }, optional: true, nullable: false, api_name: "eventAttribute"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::AchievementResponseEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achieved_at, -> { String }, optional: true, nullable: false, api_name: "achievedAt"
    end
  end
end
