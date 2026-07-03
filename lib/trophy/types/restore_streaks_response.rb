# frozen_string_literal: true

module Trophy
  module Types
    # Response containing restored users and any issues encountered.
    class RestoreStreaksResponse < Internal::Types::Model
      field :restored_users, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "restoredUsers"

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
