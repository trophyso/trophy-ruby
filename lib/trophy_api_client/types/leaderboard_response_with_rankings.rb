# frozen_string_literal: true

require_relative "leaderboard_ranking"
require_relative "leaderboard_response_status"
require_relative "leaderboard_response_rank_by"
require "ostruct"
require "json"

module TrophyApiClient
  class LeaderboardResponseWithRankings
    # @return [Array<TrophyApiClient::LeaderboardRanking>] Array of user rankings for the leaderboard.
    attr_reader :rankings
    # @return [String] The unique ID of the leaderboard.
    attr_reader :id
    # @return [String] The user-facing name of the leaderboard.
    attr_reader :name
    # @return [String] The unique key used to reference the leaderboard in APIs.
    attr_reader :key
    # @return [TrophyApiClient::LeaderboardResponseStatus] The status of the leaderboard.
    attr_reader :status
    # @return [TrophyApiClient::LeaderboardResponseRankBy] What the leaderboard ranks by.
    attr_reader :rank_by
    # @return [String] The key of the metric to rank by, if rankBy is 'metric'.
    attr_reader :metric_key
    # @return [String] The name of the metric to rank by, if rankBy is 'metric'.
    attr_reader :metric_name
    # @return [String] The key of the points system to rank by, if rankBy is 'points'.
    attr_reader :points_system_key
    # @return [String] The name of the points system to rank by, if rankBy is 'points'.
    attr_reader :points_system_name
    # @return [String] The user-facing description of the leaderboard.
    attr_reader :description
    # @return [String] The start date of the leaderboard in YYYY-MM-DD format.
    attr_reader :start
    # @return [String] The end date of the leaderboard in YYYY-MM-DD format, or null if it runs
    #  forever.
    attr_reader :end_
    # @return [Integer] The maximum number of participants in the leaderboard.
    attr_reader :max_participants
    # @return [String] The repetition type for recurring leaderboards, or null for one-time
    #  leaderboards.
    attr_reader :run_unit
    # @return [Integer] The interval between repetitions, relative to the start date and repetition
    #  type.
    attr_reader :run_interval
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param rankings [Array<TrophyApiClient::LeaderboardRanking>] Array of user rankings for the leaderboard.
    # @param id [String] The unique ID of the leaderboard.
    # @param name [String] The user-facing name of the leaderboard.
    # @param key [String] The unique key used to reference the leaderboard in APIs.
    # @param status [TrophyApiClient::LeaderboardResponseStatus] The status of the leaderboard.
    # @param rank_by [TrophyApiClient::LeaderboardResponseRankBy] What the leaderboard ranks by.
    # @param metric_key [String] The key of the metric to rank by, if rankBy is 'metric'.
    # @param metric_name [String] The name of the metric to rank by, if rankBy is 'metric'.
    # @param points_system_key [String] The key of the points system to rank by, if rankBy is 'points'.
    # @param points_system_name [String] The name of the points system to rank by, if rankBy is 'points'.
    # @param description [String] The user-facing description of the leaderboard.
    # @param start [String] The start date of the leaderboard in YYYY-MM-DD format.
    # @param end_ [String] The end date of the leaderboard in YYYY-MM-DD format, or null if it runs
    #  forever.
    # @param max_participants [Integer] The maximum number of participants in the leaderboard.
    # @param run_unit [String] The repetition type for recurring leaderboards, or null for one-time
    #  leaderboards.
    # @param run_interval [Integer] The interval between repetitions, relative to the start date and repetition
    #  type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::LeaderboardResponseWithRankings]
    def initialize(rankings:, id:, name:, key:, rank_by:, start:, max_participants:, run_interval:, status: OMIT, metric_key: OMIT, metric_name: OMIT,
                   points_system_key: OMIT, points_system_name: OMIT, description: OMIT, end_: OMIT, run_unit: OMIT, additional_properties: nil)
      @rankings = rankings
      @id = id
      @name = name
      @key = key
      @status = status if status != OMIT
      @rank_by = rank_by
      @metric_key = metric_key if metric_key != OMIT
      @metric_name = metric_name if metric_name != OMIT
      @points_system_key = points_system_key if points_system_key != OMIT
      @points_system_name = points_system_name if points_system_name != OMIT
      @description = description if description != OMIT
      @start = start
      @end_ = end_ if end_ != OMIT
      @max_participants = max_participants
      @run_unit = run_unit if run_unit != OMIT
      @run_interval = run_interval
      @additional_properties = additional_properties
      @_field_set = {
        "rankings": rankings,
        "id": id,
        "name": name,
        "key": key,
        "status": status,
        "rankBy": rank_by,
        "metricKey": metric_key,
        "metricName": metric_name,
        "pointsSystemKey": points_system_key,
        "pointsSystemName": points_system_name,
        "description": description,
        "start": start,
        "end": end_,
        "maxParticipants": max_participants,
        "runUnit": run_unit,
        "runInterval": run_interval
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LeaderboardResponseWithRankings
    #
    # @param json_object [String]
    # @return [TrophyApiClient::LeaderboardResponseWithRankings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      rankings = parsed_json["rankings"]&.map do |item|
        item = item.to_json
        TrophyApiClient::LeaderboardRanking.from_json(json_object: item)
      end
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      status = parsed_json["status"]
      rank_by = parsed_json["rankBy"]
      metric_key = parsed_json["metricKey"]
      metric_name = parsed_json["metricName"]
      points_system_key = parsed_json["pointsSystemKey"]
      points_system_name = parsed_json["pointsSystemName"]
      description = parsed_json["description"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      max_participants = parsed_json["maxParticipants"]
      run_unit = parsed_json["runUnit"]
      run_interval = parsed_json["runInterval"]
      new(
        rankings: rankings,
        id: id,
        name: name,
        key: key,
        status: status,
        rank_by: rank_by,
        metric_key: metric_key,
        metric_name: metric_name,
        points_system_key: points_system_key,
        points_system_name: points_system_name,
        description: description,
        start: start,
        end_: end_,
        max_participants: max_participants,
        run_unit: run_unit,
        run_interval: run_interval,
        additional_properties: struct
      )
    end

    # Serialize an instance of LeaderboardResponseWithRankings to a JSON object
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
      obj.rankings.is_a?(Array) != false || raise("Passed value for field obj.rankings is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::LeaderboardResponseStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.rank_by.is_a?(TrophyApiClient::LeaderboardResponseRankBy) != false || raise("Passed value for field obj.rank_by is not the expected type, validation failed.")
      obj.metric_key&.is_a?(String) != false || raise("Passed value for field obj.metric_key is not the expected type, validation failed.")
      obj.metric_name&.is_a?(String) != false || raise("Passed value for field obj.metric_name is not the expected type, validation failed.")
      obj.points_system_key&.is_a?(String) != false || raise("Passed value for field obj.points_system_key is not the expected type, validation failed.")
      obj.points_system_name&.is_a?(String) != false || raise("Passed value for field obj.points_system_name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.max_participants.is_a?(Integer) != false || raise("Passed value for field obj.max_participants is not the expected type, validation failed.")
      obj.run_unit&.is_a?(String) != false || raise("Passed value for field obj.run_unit is not the expected type, validation failed.")
      obj.run_interval.is_a?(Integer) != false || raise("Passed value for field obj.run_interval is not the expected type, validation failed.")
    end
  end
end
