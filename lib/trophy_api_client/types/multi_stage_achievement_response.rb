# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module TrophyApiClient
  class MultiStageAchievementResponse
    # @return [String] The unique ID of the achievement.
    attr_reader :id
    # @return [String] The name of this achievement.
    attr_reader :name
    # @return [String] The URL of the badge image for the achievement, if one has been uploaded.
    attr_reader :badge_url
    # @return [String] The ID of the metric associated with this achievement, if any.
    attr_reader :metric_id
    # @return [Float] The value of the metric required to complete the achievement, if this
    #  achievement is associated with a metric.
    attr_reader :metric_value
    # @return [String] The name of the metric associated with this achievement, if any.
    attr_reader :metric_name
    # @return [String] The key used to reference this achievement in the API.
    attr_reader :key
    # @return [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    attr_reader :achieved_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the achievement.
    # @param name [String] The name of this achievement.
    # @param badge_url [String] The URL of the badge image for the achievement, if one has been uploaded.
    # @param metric_id [String] The ID of the metric associated with this achievement, if any.
    # @param metric_value [Float] The value of the metric required to complete the achievement, if this
    #  achievement is associated with a metric.
    # @param metric_name [String] The name of the metric associated with this achievement, if any.
    # @param key [String] The key used to reference this achievement in the API.
    # @param achieved_at [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::MultiStageAchievementResponse]
    def initialize(id:, name: OMIT, badge_url: OMIT, metric_id: OMIT, metric_value: OMIT, metric_name: OMIT, key: OMIT,
                   achieved_at: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @badge_url = badge_url if badge_url != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @metric_value = metric_value if metric_value != OMIT
      @metric_name = metric_name if metric_name != OMIT
      @key = key if key != OMIT
      @achieved_at = achieved_at if achieved_at != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "badgeUrl": badge_url,
        "metricId": metric_id,
        "metricValue": metric_value,
        "metricName": metric_name,
        "key": key,
        "achievedAt": achieved_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MultiStageAchievementResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::MultiStageAchievementResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      badge_url = parsed_json["badgeUrl"]
      metric_id = parsed_json["metricId"]
      metric_value = parsed_json["metricValue"]
      metric_name = parsed_json["metricName"]
      key = parsed_json["key"]
      achieved_at = (DateTime.parse(parsed_json["achievedAt"]) unless parsed_json["achievedAt"].nil?)
      new(
        id: id,
        name: name,
        badge_url: badge_url,
        metric_id: metric_id,
        metric_value: metric_value,
        metric_name: metric_name,
        key: key,
        achieved_at: achieved_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of MultiStageAchievementResponse to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_value&.is_a?(Float) != false || raise("Passed value for field obj.metric_value is not the expected type, validation failed.")
      obj.metric_name&.is_a?(String) != false || raise("Passed value for field obj.metric_name is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.achieved_at&.is_a?(DateTime) != false || raise("Passed value for field obj.achieved_at is not the expected type, validation failed.")
    end
  end
end
