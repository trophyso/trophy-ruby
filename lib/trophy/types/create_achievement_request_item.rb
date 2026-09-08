# frozen_string_literal: true

module Trophy
  module Types
    # An achievement to create. Trigger-specific fields are required based on `trigger`. `status` defaults to
    # `inactive`.
    class CreateAchievementRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :trigger, -> { Trophy::Types::CreateAchievementRequestItemTrigger }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::CreateAchievementRequestItemStatus }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::CreateAchievementRequestItemBadge }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::CreateAchievementRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :key, -> { String }, optional: true, nullable: false

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_value, -> { Integer }, optional: true, nullable: false, api_name: "metricValue"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::CreateAchievementRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :anniversary_years, -> { Integer }, optional: true, nullable: false, api_name: "anniversaryYears"

      field :achievement_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "achievementIds"
    end
  end
end
