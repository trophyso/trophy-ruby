# frozen_string_literal: true

require_relative "update_leaderboard_request_item_status"
require_relative "update_leaderboard_request_item_rank_by"
require_relative "update_leaderboard_request_item_run_unit"
require "ostruct"
require "json"

module TrophyApiClient
  # A leaderboard update object. `id` is required. Once a leaderboard has been
  #  activated, the dashboard-imposed restrictions on ranking configuration and
  #  scheduling changes still apply.
  class UpdateLeaderboardRequestItem
    # @return [String] The UUID of the leaderboard to update.
    attr_reader :id
    # @return [String] The updated leaderboard name.
    attr_reader :name
    # @return [String] The updated leaderboard key. This can only be changed while the leaderboard is
    #  inactive.
    attr_reader :key
    # @return [String] The updated leaderboard description.
    attr_reader :description
    # @return [TrophyApiClient::UpdateLeaderboardRequestItemStatus] The target user-facing status. `scheduled` activates a leaderboard whose start
    #  date is in the future. `finished` behaves like the dashboard finish action.
    attr_reader :status
    # @return [TrophyApiClient::UpdateLeaderboardRequestItemRankBy] The updated ranking criterion. This can only be changed while the leaderboard is
    #  inactive.
    attr_reader :rank_by
    # @return [String] The metric ID to use when `rankBy` is `metric`.
    attr_reader :metric_id
    # @return [String] The points system ID to use when `rankBy` is `points`.
    attr_reader :points_system_id
    # @return [Integer] The updated maximum number of participants.
    attr_reader :max_participants
    # @return [String] The updated start date in YYYY-MM-DD format.
    attr_reader :start
    # @return [String] The updated end date in YYYY-MM-DD format, or `null` to clear it.
    attr_reader :end_
    # @return [Array<String>] The updated breakdown attribute UUIDs.
    attr_reader :breakdown_attributes
    # @return [TrophyApiClient::UpdateLeaderboardRequestItemRunUnit] The updated recurrence unit.
    attr_reader :run_unit
    # @return [Integer] The updated recurrence interval.
    attr_reader :run_interval
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the leaderboard to update.
    # @param name [String] The updated leaderboard name.
    # @param key [String] The updated leaderboard key. This can only be changed while the leaderboard is
    #  inactive.
    # @param description [String] The updated leaderboard description.
    # @param status [TrophyApiClient::UpdateLeaderboardRequestItemStatus] The target user-facing status. `scheduled` activates a leaderboard whose start
    #  date is in the future. `finished` behaves like the dashboard finish action.
    # @param rank_by [TrophyApiClient::UpdateLeaderboardRequestItemRankBy] The updated ranking criterion. This can only be changed while the leaderboard is
    #  inactive.
    # @param metric_id [String] The metric ID to use when `rankBy` is `metric`.
    # @param points_system_id [String] The points system ID to use when `rankBy` is `points`.
    # @param max_participants [Integer] The updated maximum number of participants.
    # @param start [String] The updated start date in YYYY-MM-DD format.
    # @param end_ [String] The updated end date in YYYY-MM-DD format, or `null` to clear it.
    # @param breakdown_attributes [Array<String>] The updated breakdown attribute UUIDs.
    # @param run_unit [TrophyApiClient::UpdateLeaderboardRequestItemRunUnit] The updated recurrence unit.
    # @param run_interval [Integer] The updated recurrence interval.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdateLeaderboardRequestItem]
    def initialize(id:, name: OMIT, key: OMIT, description: OMIT, status: OMIT, rank_by: OMIT, metric_id: OMIT,
                   points_system_id: OMIT, max_participants: OMIT, start: OMIT, end_: OMIT, breakdown_attributes: OMIT, run_unit: OMIT, run_interval: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @key = key if key != OMIT
      @description = description if description != OMIT
      @status = status if status != OMIT
      @rank_by = rank_by if rank_by != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @points_system_id = points_system_id if points_system_id != OMIT
      @max_participants = max_participants if max_participants != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @breakdown_attributes = breakdown_attributes if breakdown_attributes != OMIT
      @run_unit = run_unit if run_unit != OMIT
      @run_interval = run_interval if run_interval != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "key": key,
        "description": description,
        "status": status,
        "rankBy": rank_by,
        "metricId": metric_id,
        "pointsSystemId": points_system_id,
        "maxParticipants": max_participants,
        "start": start,
        "end": end_,
        "breakdownAttributes": breakdown_attributes,
        "runUnit": run_unit,
        "runInterval": run_interval
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateLeaderboardRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdateLeaderboardRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      description = parsed_json["description"]
      status = parsed_json["status"]
      rank_by = parsed_json["rankBy"]
      metric_id = parsed_json["metricId"]
      points_system_id = parsed_json["pointsSystemId"]
      max_participants = parsed_json["maxParticipants"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      breakdown_attributes = parsed_json["breakdownAttributes"]
      run_unit = parsed_json["runUnit"]
      run_interval = parsed_json["runInterval"]
      new(
        id: id,
        name: name,
        key: key,
        description: description,
        status: status,
        rank_by: rank_by,
        metric_id: metric_id,
        points_system_id: points_system_id,
        max_participants: max_participants,
        start: start,
        end_: end_,
        breakdown_attributes: breakdown_attributes,
        run_unit: run_unit,
        run_interval: run_interval,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateLeaderboardRequestItem to a JSON object
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
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::UpdateLeaderboardRequestItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.rank_by&.is_a?(TrophyApiClient::UpdateLeaderboardRequestItemRankBy) != false || raise("Passed value for field obj.rank_by is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.points_system_id&.is_a?(String) != false || raise("Passed value for field obj.points_system_id is not the expected type, validation failed.")
      obj.max_participants&.is_a?(Integer) != false || raise("Passed value for field obj.max_participants is not the expected type, validation failed.")
      obj.start&.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.breakdown_attributes&.is_a?(Array) != false || raise("Passed value for field obj.breakdown_attributes is not the expected type, validation failed.")
      obj.run_unit&.is_a?(TrophyApiClient::UpdateLeaderboardRequestItemRunUnit) != false || raise("Passed value for field obj.run_unit is not the expected type, validation failed.")
      obj.run_interval&.is_a?(Integer) != false || raise("Passed value for field obj.run_interval is not the expected type, validation failed.")
    end
  end
end
