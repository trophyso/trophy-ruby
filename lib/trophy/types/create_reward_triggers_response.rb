# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created triggers and any per-item issues.
    class CreateRewardTriggersResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminRewardTrigger] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
