# frozen_string_literal: true

module Trophy
  module Types
    # A step of a goal: a goal of its own, with its own key, one level deep. A step whose key the goal already has is
    # updated, with fields left out staying as they are.
    class GoalStepRequest < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: true, nullable: false

      field :completion, -> { Trophy::Types::GoalCompletion }, optional: true, nullable: false

      field :due_at, -> { String }, optional: true, nullable: false, api_name: "dueAt"

      field :completed_at, -> { String }, optional: true, nullable: false, api_name: "completedAt"

      field :metric, -> { String }, optional: true, nullable: false

      field :target, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false
    end
  end
end
