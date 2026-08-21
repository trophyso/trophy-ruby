# frozen_string_literal: true

module Trophy
  module Types
    # Response containing deleted streak pauses and any issues encountered.
    class DeleteStreakPausesResponse < Internal::Types::Model
      field :deleted, -> { Internal::Types::Array[Trophy::Types::DeletedResource] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
