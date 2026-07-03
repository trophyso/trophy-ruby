# frozen_string_literal: true

module Trophy
  module Types
    class PointsLevelSummaryResponseItem < Internal::Types::Model
      field :level, -> { Trophy::Types::PointsLevel }, optional: false, nullable: false

      field :users, -> { Integer }, optional: false, nullable: false
    end
  end
end
