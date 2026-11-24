# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class CreateGoalRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :key, -> { String }, optional: false, nullable: false

        field :parent, -> { String }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false

        field :completion, -> { Trophy::Types::GoalCompletion }, optional: true, nullable: false

        field :due_at, -> { String }, optional: true, nullable: false, api_name: "dueAt"

        field :completed_at, -> { String }, optional: true, nullable: false, api_name: "completedAt"

        field :metric, -> { String }, optional: true, nullable: false

        field :target, -> { Integer }, optional: true, nullable: false

        field :start, -> { String }, optional: true, nullable: false

        field :steps, -> { Internal::Types::Array[Trophy::Types::GoalStepRequest] }, optional: true, nullable: false
      end
    end
  end
end
