# frozen_string_literal: true

require_relative "points_trigger"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsAward
    # @return [String] The ID of the trigger award
    attr_reader :id
    # @return [Float] The points awarded by this trigger
    attr_reader :awarded
    # @return [String] The date these points were awarded, in ISO 8601 format.
    attr_reader :date
    # @return [Float] The user's total points after this award occurred.
    attr_reader :total
    # @return [TrophyApiClient::PointsTrigger]
    attr_reader :trigger
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the trigger award
    # @param awarded [Float] The points awarded by this trigger
    # @param date [String] The date these points were awarded, in ISO 8601 format.
    # @param total [Float] The user's total points after this award occurred.
    # @param trigger [TrophyApiClient::PointsTrigger]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsAward]
    def initialize(id: OMIT, awarded: OMIT, date: OMIT, total: OMIT, trigger: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @awarded = awarded if awarded != OMIT
      @date = date if date != OMIT
      @total = total if total != OMIT
      @trigger = trigger if trigger != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "awarded": awarded,
        "date": date,
        "total": total,
        "trigger": trigger
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsAward
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsAward]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      awarded = parsed_json["awarded"]
      date = parsed_json["date"]
      total = parsed_json["total"]
      if parsed_json["trigger"].nil?
        trigger = nil
      else
        trigger = parsed_json["trigger"].to_json
        trigger = TrophyApiClient::PointsTrigger.from_json(json_object: trigger)
      end
      new(
        id: id,
        awarded: awarded,
        date: date,
        total: total,
        trigger: trigger,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsAward to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.awarded&.is_a?(Float) != false || raise("Passed value for field obj.awarded is not the expected type, validation failed.")
      obj.date&.is_a?(String) != false || raise("Passed value for field obj.date is not the expected type, validation failed.")
      obj.total&.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.trigger.nil? || TrophyApiClient::PointsTrigger.validate_raw(obj: obj.trigger)
    end
  end
end
