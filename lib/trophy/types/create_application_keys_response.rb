# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created application API keys and any issues.
    class CreateApplicationKeysResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::CreatedApplicationKey] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
