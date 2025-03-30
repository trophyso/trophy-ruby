# frozen_string_literal: true

require_relative "event_response_metrics_item"
require_relative "streak_response"
require "ostruct"
require "json"

module TrophyApiClient
  class EventResponse
    # @return [String] The unique ID of the event.
    attr_reader :event_id
    # @return [String] The unique ID of the metric that was updated.
    attr_reader :metric_id
    # @return [Float] The user's new total progress against the metric.
    attr_reader :total
    # @return [Array<TrophyApiClient::EventResponseMetricsItem>] Changes to achievements as a result of this event.
    attr_reader :achievements
    # @return [TrophyApiClient::StreakResponse] The user's current streak for the metric, if the metric has streaks enabled.
    attr_reader :current_streak
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_id [String] The unique ID of the event.
    # @param metric_id [String] The unique ID of the metric that was updated.
    # @param total [Float] The user's new total progress against the metric.
    # @param achievements [Array<TrophyApiClient::EventResponseMetricsItem>] Changes to achievements as a result of this event.
    # @param current_streak [TrophyApiClient::StreakResponse] The user's current streak for the metric, if the metric has streaks enabled.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::EventResponse]
    def initialize(event_id:, metric_id:, total:, achievements: OMIT, current_streak: OMIT, additional_properties: nil)
      @event_id = event_id
      @metric_id = metric_id
      @total = total
      @achievements = achievements if achievements != OMIT
      @current_streak = current_streak if current_streak != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "eventId": event_id,
        "metricId": metric_id,
        "total": total,
        "achievements": achievements,
        "currentStreak": current_streak
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EventResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::EventResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_id = parsed_json["eventId"]
      metric_id = parsed_json["metricId"]
      total = parsed_json["total"]
      achievements = parsed_json["achievements"]&.map do |item|
        item = item.to_json
        TrophyApiClient::EventResponseMetricsItem.from_json(json_object: item)
      end
      if parsed_json["currentStreak"].nil?
        current_streak = nil
      else
        current_streak = parsed_json["currentStreak"].to_json
        current_streak = TrophyApiClient::StreakResponse.from_json(json_object: current_streak)
      end
      new(
        event_id: event_id,
        metric_id: metric_id,
        total: total,
        achievements: achievements,
        current_streak: current_streak,
        additional_properties: struct
      )
    end

    # Serialize an instance of EventResponse to a JSON object
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
      obj.event_id.is_a?(String) != false || raise("Passed value for field obj.event_id is not the expected type, validation failed.")
      obj.metric_id.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.total.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.achievements&.is_a?(Array) != false || raise("Passed value for field obj.achievements is not the expected type, validation failed.")
      obj.current_streak.nil? || TrophyApiClient::StreakResponse.validate_raw(obj: obj.current_streak)
    end
  end
end
