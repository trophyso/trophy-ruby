# frozen_string_literal: true

require_relative "event_response_metrics_item_completed_item"
require "ostruct"
require "json"

module TrophyApiClient
  class EventResponseMetricsItem
    # @return [String] The trigger of the achievement, in this case either 'metric' or 'streak'.
    attr_reader :trigger
    # @return [String] The ID of the metric that these achievements are associated with, if any.
    attr_reader :metric_id
    # @return [Array<TrophyApiClient::EventResponseMetricsItemCompletedItem>] A list of any new achievements that the user has now completed as a result of
    #  this event being submitted.
    attr_reader :completed
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param trigger [String] The trigger of the achievement, in this case either 'metric' or 'streak'.
    # @param metric_id [String] The ID of the metric that these achievements are associated with, if any.
    # @param completed [Array<TrophyApiClient::EventResponseMetricsItemCompletedItem>] A list of any new achievements that the user has now completed as a result of
    #  this event being submitted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::EventResponseMetricsItem]
    def initialize(completed:, trigger: OMIT, metric_id: OMIT, additional_properties: nil)
      @trigger = trigger if trigger != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @completed = completed
      @additional_properties = additional_properties
      @_field_set = { "trigger": trigger, "metricId": metric_id, "completed": completed }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EventResponseMetricsItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::EventResponseMetricsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      trigger = parsed_json["trigger"]
      metric_id = parsed_json["metricId"]
      completed = parsed_json["completed"]&.map do |item|
        item = item.to_json
        TrophyApiClient::EventResponseMetricsItemCompletedItem.from_json(json_object: item)
      end
      new(
        trigger: trigger,
        metric_id: metric_id,
        completed: completed,
        additional_properties: struct
      )
    end

    # Serialize an instance of EventResponseMetricsItem to a JSON object
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
      obj.trigger&.is_a?(String) != false || raise("Passed value for field obj.trigger is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.completed.is_a?(Array) != false || raise("Passed value for field obj.completed is not the expected type, validation failed.")
    end
  end
end
