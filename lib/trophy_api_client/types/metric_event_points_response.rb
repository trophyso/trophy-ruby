# frozen_string_literal: true

require_relative "points_award"
require "ostruct"
require "json"

module TrophyApiClient
  class MetricEventPointsResponse
    # @return [Float] The points added by this event.
    attr_reader :added
    # @return [Float] The user's total points
    attr_reader :total
    # @return [Array<TrophyApiClient::PointsAward>] Array of trigger awards that added points.
    attr_reader :awards
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param added [Float] The points added by this event.
    # @param total [Float] The user's total points
    # @param awards [Array<TrophyApiClient::PointsAward>] Array of trigger awards that added points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::MetricEventPointsResponse]
    def initialize(added: OMIT, total: OMIT, awards: OMIT, additional_properties: nil)
      @added = added if added != OMIT
      @total = total if total != OMIT
      @awards = awards if awards != OMIT
      @additional_properties = additional_properties
      @_field_set = { "added": added, "total": total, "awards": awards }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MetricEventPointsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::MetricEventPointsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      added = parsed_json["added"]
      total = parsed_json["total"]
      awards = parsed_json["awards"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsAward.from_json(json_object: item)
      end
      new(
        added: added,
        total: total,
        awards: awards,
        additional_properties: struct
      )
    end

    # Serialize an instance of MetricEventPointsResponse to a JSON object
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
      obj.added&.is_a?(Float) != false || raise("Passed value for field obj.added is not the expected type, validation failed.")
      obj.total&.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.awards&.is_a?(Array) != false || raise("Passed value for field obj.awards is not the expected type, validation failed.")
    end
  end
end
