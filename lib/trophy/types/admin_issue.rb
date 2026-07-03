# frozen_string_literal: true

module Trophy
  module Types
    # An issue encountered while processing an item in an admin API request.
    class AdminIssue < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: false, api_name: "userId"

      field :boost_id, -> { String }, optional: true, nullable: false, api_name: "boostId"

      field :index, -> { Integer }, optional: true, nullable: false

      field :severity, -> { Trophy::Types::AdminIssueSeverity }, optional: false, nullable: false

      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
