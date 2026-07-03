# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersMetricEventSummaryResponseItem < Internal::Types::Model
        field :date, -> { String }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :change, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
