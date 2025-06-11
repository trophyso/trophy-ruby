# frozen_string_literal: true

require_relative "metric_status"
require_relative "achievement_response"
require "ostruct"
require "json"

module TrophyApiClient
  class MetricResponse
    # @return [String] The unique ID of the metric.
    attr_reader :id
    # @return [String] The unique key of the metric.
    attr_reader :key
    # @return [String] The name of the metric.
    attr_reader :name
    # @return [TrophyApiClient::MetricStatus] The status of the metric.
    attr_reader :status
    # @return [Float] The user's current total for the metric.
    attr_reader :current
    # @return [Array<TrophyApiClient::AchievementResponse>] A list of the metric's achievements and the user's progress towards each.
    attr_reader :achievements
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the metric.
    # @param key [String] The unique key of the metric.
    # @param name [String] The name of the metric.
    # @param status [TrophyApiClient::MetricStatus] The status of the metric.
    # @param current [Float] The user's current total for the metric.
    # @param achievements [Array<TrophyApiClient::AchievementResponse>] A list of the metric's achievements and the user's progress towards each.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::MetricResponse]
    def initialize(id:, key:, name:, status:, current:, achievements:, additional_properties: nil)
      @id = id
      @key = key
      @name = name
      @status = status
      @current = current
      @achievements = achievements
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "key": key,
        "name": name,
        "status": status,
        "current": current,
        "achievements": achievements
      }
    end

    # Deserialize a JSON object to an instance of MetricResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::MetricResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      key = parsed_json["key"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      current = parsed_json["current"]
      achievements = parsed_json["achievements"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AchievementResponse.from_json(json_object: item)
      end
      new(
        id: id,
        key: key,
        name: name,
        status: status,
        current: current,
        achievements: achievements,
        additional_properties: struct
      )
    end

    # Serialize an instance of MetricResponse to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::MetricStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.current.is_a?(Float) != false || raise("Passed value for field obj.current is not the expected type, validation failed.")
      obj.achievements.is_a?(Array) != false || raise("Passed value for field obj.achievements is not the expected type, validation failed.")
    end
  end
end
