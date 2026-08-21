# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created streak pauses and any issues encountered.
    class CreateStreakPausesResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminStreakPause] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
