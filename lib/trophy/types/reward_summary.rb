# frozen_string_literal: true

module Trophy
  module Types
    class RewardSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :type, -> { Trophy::Types::RewardSummaryType }, optional: false, nullable: false

      field :points, -> { Integer }, optional: true, nullable: false

      field :points_system_id, -> { String }, optional: true, nullable: false, api_name: "pointsSystemId"

      field :points_system_key, -> { String }, optional: true, nullable: false, api_name: "pointsSystemKey"
    end
  end
end
