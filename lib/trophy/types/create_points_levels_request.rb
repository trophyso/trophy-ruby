# frozen_string_literal: true

module Trophy
  module Types
    module CreatePointsLevelsRequest
      # CreatePointsLevelsRequest is an alias for Array

      # @option str [String]
      #
      # @return [untyped]
      def self.load(str)
        ::JSON.parse(str)
      end

      # @option value [untyped]
      #
      # @return [String]
      def self.dump(value)
        ::JSON.generate(value)
      end
    end
  end
end
