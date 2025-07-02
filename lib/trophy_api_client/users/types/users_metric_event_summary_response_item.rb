# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class Users
    class UsersMetricEventSummaryResponseItem
      # @return [String] The date of the data point. For weekly or monthly aggregations, this is the
      #  first date of the period.
      attr_reader :date
      # @return [Float] The user's total for this metric at the end of this date.
      attr_reader :total
      # @return [Float] The change in the user's total for this metric during this period.
      attr_reader :change
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param date [String] The date of the data point. For weekly or monthly aggregations, this is the
      #  first date of the period.
      # @param total [Float] The user's total for this metric at the end of this date.
      # @param change [Float] The change in the user's total for this metric during this period.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [TrophyApiClient::Users::UsersMetricEventSummaryResponseItem]
      def initialize(date:, total:, change:, additional_properties: nil)
        @date = date
        @total = total
        @change = change
        @additional_properties = additional_properties
        @_field_set = { "date": date, "total": total, "change": change }
      end

      # Deserialize a JSON object to an instance of UsersMetricEventSummaryResponseItem
      #
      # @param json_object [String]
      # @return [TrophyApiClient::Users::UsersMetricEventSummaryResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        date = parsed_json["date"]
        total = parsed_json["total"]
        change = parsed_json["change"]
        new(
          date: date,
          total: total,
          change: change,
          additional_properties: struct
        )
      end

      # Serialize an instance of UsersMetricEventSummaryResponseItem to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.date.is_a?(String) != false || raise("Passed value for field obj.date is not the expected type, validation failed.")
        obj.total.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
        obj.change.is_a?(Float) != false || raise("Passed value for field obj.change is not the expected type, validation failed.")
      end
    end
  end
end
