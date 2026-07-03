# frozen_string_literal: true

module Trophy
  module Types
    # A user's metric data for a wrapped period.
    class WrappedMetric < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :units, -> { String }, optional: true, nullable: false

      field :current_total, -> { Integer }, optional: false, nullable: false, api_name: "currentTotal"

      field :change_this_period, -> { Integer }, optional: false, nullable: false, api_name: "changeThisPeriod"

      field :percent_change, -> { Integer }, optional: false, nullable: false, api_name: "percentChange"

      field :percentile_this_period, -> { Integer }, optional: true, nullable: false, api_name: "percentileThisPeriod"

      field :by_attribute, -> { Internal::Types::Hash[String, Internal::Types::Hash[String, Trophy::Types::WrappedMetricByAttributeValueValue]] }, optional: false, nullable: false, api_name: "byAttribute"
    end
  end
end
