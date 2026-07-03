# frozen_string_literal: true

module Trophy
  module Points
    module Types
      class PointsSummaryRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :user_attributes, -> { String }, optional: true, nullable: false, api_name: "userAttributes"
      end
    end
  end
end
