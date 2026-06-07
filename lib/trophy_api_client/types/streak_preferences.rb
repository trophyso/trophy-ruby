# frozen_string_literal: true

require_relative "streak_evaluation_mode_preference"
require_relative "streak_metric_preference"
require "ostruct"
require "json"

module TrophyApiClient
  # Per-user streak configuration. Requires streak customization to be enabled in
  #  dashboard settings.
  class StreakPreferences
    # @return [TrophyApiClient::StreakEvaluationModePreference]
    attr_reader :evaluation_mode
    # @return [Array<TrophyApiClient::StreakMetricPreference>] Metrics and thresholds that count toward this user's streak.
    attr_reader :metrics
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param evaluation_mode [TrophyApiClient::StreakEvaluationModePreference]
    # @param metrics [Array<TrophyApiClient::StreakMetricPreference>] Metrics and thresholds that count toward this user's streak.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakPreferences]
    def initialize(evaluation_mode: OMIT, metrics: OMIT, additional_properties: nil)
      @evaluation_mode = evaluation_mode if evaluation_mode != OMIT
      @metrics = metrics if metrics != OMIT
      @additional_properties = additional_properties
      @_field_set = { "evaluationMode": evaluation_mode, "metrics": metrics }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StreakPreferences
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakPreferences]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      evaluation_mode = parsed_json["evaluationMode"]
      metrics = parsed_json["metrics"]&.map do |item|
        item = item.to_json
        TrophyApiClient::StreakMetricPreference.from_json(json_object: item)
      end
      new(
        evaluation_mode: evaluation_mode,
        metrics: metrics,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakPreferences to a JSON object
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
      obj.evaluation_mode&.is_a?(TrophyApiClient::StreakEvaluationModePreference) != false || raise("Passed value for field obj.evaluation_mode is not the expected type, validation failed.")
      obj.metrics&.is_a?(Array) != false || raise("Passed value for field obj.metrics is not the expected type, validation failed.")
    end
  end
end
