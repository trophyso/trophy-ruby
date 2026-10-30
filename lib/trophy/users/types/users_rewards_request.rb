# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersRewardsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :redeemed, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false, api_name: "startDate"

        field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

        field :skip, -> { Integer }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
