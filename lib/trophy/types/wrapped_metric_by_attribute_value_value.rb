# frozen_string_literal: true

module Trophy
  module Types
    class WrappedMetricByAttributeValueValue < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :units, -> { String }, optional: true, nullable: false

      field :current_total, -> { Integer }, optional: true, nullable: false, api_name: "currentTotal"

      field :change_this_period, -> { Integer }, optional: true, nullable: false, api_name: "changeThisPeriod"

      field :percent_change, -> { Integer }, optional: true, nullable: false, api_name: "percentChange"

      field :percentile_this_period, -> { Integer }, optional: true, nullable: false, api_name: "percentileThisPeriod"
    end
  end
end
