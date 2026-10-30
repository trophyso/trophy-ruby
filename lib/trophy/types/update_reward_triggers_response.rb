# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated triggers and any issues encountered.
    class UpdateRewardTriggersResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminRewardTrigger] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
