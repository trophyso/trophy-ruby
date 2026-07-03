# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersPointsEventSummaryRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :key, -> { String }, optional: false, nullable: false

        field :aggregation, -> { Trophy::Users::Types::UsersPointsEventSummaryRequestAggregation }, optional: false, nullable: false

        field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: false, nullable: false, api_name: "endDate"
      end
    end
  end
end
