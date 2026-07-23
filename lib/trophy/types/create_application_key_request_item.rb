# frozen_string_literal: true

module Trophy
  module Types
    # A user to create an application API key for.
    class CreateApplicationKeyRequestItem < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
    end
  end
end
