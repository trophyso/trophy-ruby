# frozen_string_literal: true

module Trophy
  module Types
    # Response containing any issues encountered while creating streak freezes.
    class CreateStreakFreezesResponse < Internal::Types::Model
      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
