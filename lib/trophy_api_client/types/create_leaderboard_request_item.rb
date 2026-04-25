# frozen_string_literal: true

require_relative "create_leaderboard_request_item_status"
require_relative "create_leaderboard_request_item_rank_by"
require_relative "create_leaderboard_request_item_run_unit"
require "ostruct"
require "json"

module TrophyApiClient
  # A leaderboard to create.
  class CreateLeaderboardRequestItem
    # @return [String] The leaderboard name.
    attr_reader :name
    # @return [String] The leaderboard key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    attr_reader :key
    # @return [String] The leaderboard description.
    attr_reader :description
    # @return [TrophyApiClient::CreateLeaderboardRequestItemStatus] The initial user-facing status. Defaults to `inactive`. Use `scheduled` for
    #  leaderboards that should be active in the future and `finished` only when
    #  creating a leaderboard with an end date in the past.
    attr_reader :status
    # @return [TrophyApiClient::CreateLeaderboardRequestItemRankBy] What the leaderboard ranks by.
    attr_reader :rank_by
    # @return [String] The metric ID to rank by when `rankBy` is `metric`.
    attr_reader :metric_id
    # @return [String] The points system ID to rank by when `rankBy` is `points`.
    attr_reader :points_system_id
    # @return [Integer] The maximum number of participants. Defaults to `1000`.
    attr_reader :max_participants
    # @return [String] The leaderboard start date in YYYY-MM-DD format. Defaults to today when omitted.
    attr_reader :start
    # @return [String] The optional leaderboard end date in YYYY-MM-DD format.
    attr_reader :end_
    # @return [Array<String>] The UUIDs of the active user attributes to break rankings down by.
    attr_reader :breakdown_attributes
    # @return [TrophyApiClient::CreateLeaderboardRequestItemRunUnit] How often the leaderboard repeats. Omit for a non-recurring leaderboard. Streak
    #  leaderboards cannot repeat.
    attr_reader :run_unit
    # @return [Integer] The number of `runUnit`s between repeats. Required when `runUnit` is set.
    attr_reader :run_interval
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The leaderboard name.
    # @param key [String] The leaderboard key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    # @param description [String] The leaderboard description.
    # @param status [TrophyApiClient::CreateLeaderboardRequestItemStatus] The initial user-facing status. Defaults to `inactive`. Use `scheduled` for
    #  leaderboards that should be active in the future and `finished` only when
    #  creating a leaderboard with an end date in the past.
    # @param rank_by [TrophyApiClient::CreateLeaderboardRequestItemRankBy] What the leaderboard ranks by.
    # @param metric_id [String] The metric ID to rank by when `rankBy` is `metric`.
    # @param points_system_id [String] The points system ID to rank by when `rankBy` is `points`.
    # @param max_participants [Integer] The maximum number of participants. Defaults to `1000`.
    # @param start [String] The leaderboard start date in YYYY-MM-DD format. Defaults to today when omitted.
    # @param end_ [String] The optional leaderboard end date in YYYY-MM-DD format.
    # @param breakdown_attributes [Array<String>] The UUIDs of the active user attributes to break rankings down by.
    # @param run_unit [TrophyApiClient::CreateLeaderboardRequestItemRunUnit] How often the leaderboard repeats. Omit for a non-recurring leaderboard. Streak
    #  leaderboards cannot repeat.
    # @param run_interval [Integer] The number of `runUnit`s between repeats. Required when `runUnit` is set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreateLeaderboardRequestItem]
    def initialize(name:, key:, rank_by:, description: OMIT, status: OMIT, metric_id: OMIT, points_system_id: OMIT,
                   max_participants: OMIT, start: OMIT, end_: OMIT, breakdown_attributes: OMIT, run_unit: OMIT, run_interval: OMIT, additional_properties: nil)
      @name = name
      @key = key
      @description = description if description != OMIT
      @status = status if status != OMIT
      @rank_by = rank_by
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

    # Deserialize a JSON object to an instance of CreateLeaderboardRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreateLeaderboardRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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

    # Serialize an instance of CreateLeaderboardRequestItem to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::CreateLeaderboardRequestItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.rank_by.is_a?(TrophyApiClient::CreateLeaderboardRequestItemRankBy) != false || raise("Passed value for field obj.rank_by is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.points_system_id&.is_a?(String) != false || raise("Passed value for field obj.points_system_id is not the expected type, validation failed.")
      obj.max_participants&.is_a?(Integer) != false || raise("Passed value for field obj.max_participants is not the expected type, validation failed.")
      obj.start&.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.breakdown_attributes&.is_a?(Array) != false || raise("Passed value for field obj.breakdown_attributes is not the expected type, validation failed.")
      obj.run_unit&.is_a?(TrophyApiClient::CreateLeaderboardRequestItemRunUnit) != false || raise("Passed value for field obj.run_unit is not the expected type, validation failed.")
      obj.run_interval&.is_a?(Integer) != false || raise("Passed value for field obj.run_interval is not the expected type, validation failed.")
    end
  end
end
