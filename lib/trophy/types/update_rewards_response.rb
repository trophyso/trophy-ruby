# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated rewards and any per-item issues.
    class UpdateRewardsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminReward] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
