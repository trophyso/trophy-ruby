# frozen_string_literal: true

require_relative "completed_achievement_response"
require_relative "metric_event_streak_response"
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
    # @return [Array<TrophyApiClient::CompletedAchievementResponse>] Achievements completed as a result of this event.
    attr_reader :achievements
    # @return [TrophyApiClient::MetricEventStreakResponse] The user's current streak.
    attr_reader :current_streak
    # @return [Hash{String => TrophyApiClient::MetricEventPointsResponse}] A map of points systems by key.
    attr_reader :points
    # @return [Hash{String => TrophyApiClient::MetricEventLeaderboardResponse}] A map of leaderboards by key.
    attr_reader :leaderboards
    # @return [String] The idempotency key used for the event, if one was provided.
    attr_reader :idempotency_key
    # @return [Boolean] Whether the event was replayed due to idempotency.
    attr_reader :idempotent_replayed
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_id [String] The unique ID of the event.
    # @param metric_id [String] The unique ID of the metric that was updated.
    # @param total [Float] The user's new total progress against the metric.
    # @param achievements [Array<TrophyApiClient::CompletedAchievementResponse>] Achievements completed as a result of this event.
    # @param current_streak [TrophyApiClient::MetricEventStreakResponse] The user's current streak.
    # @param points [Hash{String => TrophyApiClient::MetricEventPointsResponse}] A map of points systems by key.
    # @param leaderboards [Hash{String => TrophyApiClient::MetricEventLeaderboardResponse}] A map of leaderboards by key.
    # @param idempotency_key [String] The idempotency key used for the event, if one was provided.
    # @param idempotent_replayed [Boolean] Whether the event was replayed due to idempotency.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::EventResponse]
    def initialize(event_id:, metric_id:, total:, achievements: OMIT, current_streak: OMIT, points: OMIT,
                   leaderboards: OMIT, idempotency_key: OMIT, idempotent_replayed: OMIT, additional_properties: nil)
      @event_id = event_id
      @metric_id = metric_id
      @total = total
      @achievements = achievements if achievements != OMIT
      @current_streak = current_streak if current_streak != OMIT
      @points = points if points != OMIT
      @leaderboards = leaderboards if leaderboards != OMIT
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @idempotent_replayed = idempotent_replayed if idempotent_replayed != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "eventId": event_id,
        "metricId": metric_id,
        "total": total,
        "achievements": achievements,
        "currentStreak": current_streak,
        "points": points,
        "leaderboards": leaderboards,
        "idempotencyKey": idempotency_key,
        "idempotentReplayed": idempotent_replayed
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
        TrophyApiClient::CompletedAchievementResponse.from_json(json_object: item)
      end
      if parsed_json["currentStreak"].nil?
        current_streak = nil
      else
        current_streak = parsed_json["currentStreak"].to_json
        current_streak = TrophyApiClient::MetricEventStreakResponse.from_json(json_object: current_streak)
      end
      points = parsed_json["points"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::MetricEventPointsResponse.from_json(json_object: value)
      end
      leaderboards = parsed_json["leaderboards"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::MetricEventLeaderboardResponse.from_json(json_object: value)
      end
      idempotency_key = parsed_json["idempotencyKey"]
      idempotent_replayed = parsed_json["idempotentReplayed"]
      new(
        event_id: event_id,
        metric_id: metric_id,
        total: total,
        achievements: achievements,
        current_streak: current_streak,
        points: points,
        leaderboards: leaderboards,
        idempotency_key: idempotency_key,
        idempotent_replayed: idempotent_replayed,
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
      obj.current_streak.nil? || TrophyApiClient::MetricEventStreakResponse.validate_raw(obj: obj.current_streak)
      obj.points&.is_a?(Hash) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.leaderboards&.is_a?(Hash) != false || raise("Passed value for field obj.leaderboards is not the expected type, validation failed.")
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.idempotent_replayed&.is_a?(Boolean) != false || raise("Passed value for field obj.idempotent_replayed is not the expected type, validation failed.")
    end
  end
end
