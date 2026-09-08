# frozen_string_literal: true

module Trophy
  module Types
    # An achievement as returned from admin endpoints. Trigger-specific fields are only present for the matching trigger
    # type.
    class AdminAchievement < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :trigger, -> { Trophy::Types::AdminAchievementTrigger }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminAchievementStatus }, optional: false, nullable: false

      field :badge, -> { Trophy::Types::AdminAchievementBadge }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::AdminAchievementUserAttributesItem] }, optional: false, nullable: false, api_name: "userAttributes"

      field :key, -> { String }, optional: true, nullable: false

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_value, -> { Integer }, optional: true, nullable: false, api_name: "metricValue"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::AdminAchievementEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :anniversary_years, -> { Integer }, optional: true, nullable: false, api_name: "anniversaryYears"

      field :achievement_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "achievementIds"
    end
  end
end
