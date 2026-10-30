# frozen_string_literal: true

module Trophy
  module Types
    module RewardWebhookEventType
      extend Trophy::Internal::Types::Enum

      REWARD_AWARDED = "reward.awarded"
      REWARD_REDEEMED = "reward.redeemed"
    end
  end
end
