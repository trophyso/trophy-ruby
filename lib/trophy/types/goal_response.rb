# frozen_string_literal: true

module Trophy
  module Types
    # A user's goal or step.
    class GoalResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :parent, -> { String }, optional: true, nullable: false

      field :label, -> { String }, optional: true, nullable: false

      field :completion, -> { Trophy::Types::GoalCompletion }, optional: false, nullable: false

      field :due_at, -> { String }, optional: true, nullable: false, api_name: "dueAt"

      field :completed_at, -> { String }, optional: true, nullable: false, api_name: "completedAt"

      field :status, -> { Trophy::Types::GoalStatus }, optional: false, nullable: false

      field :steps, -> { Internal::Types::Array[Trophy::Types::GoalResponse] }, optional: false, nullable: false

      field :done, -> { Integer }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :metric, -> { String }, optional: true, nullable: false

      field :target, -> { Integer }, optional: true, nullable: false

      field :start, -> { String }, optional: true, nullable: false

      field :current, -> { Integer }, optional: true, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :updated, -> { String }, optional: false, nullable: false
    end
  end
end
