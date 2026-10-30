# frozen_string_literal: true

module Trophy
  module Types
    # A reward returned from the admin rewards endpoints.
    class AdminReward < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::AdminRewardStatus }, optional: false, nullable: false

      field :type, -> { Trophy::Types::AdminRewardType }, optional: false, nullable: false

      field :points_system_id, -> { String }, optional: true, nullable: false, api_name: "pointsSystemId"

      field :points, -> { Integer }, optional: true, nullable: false

      field :max_redemptions, -> { Integer }, optional: true, nullable: false, api_name: "maxRedemptions"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::AdminRewardUserAttributesItem] }, optional: false, nullable: false, api_name: "userAttributes"
    end
  end
end
