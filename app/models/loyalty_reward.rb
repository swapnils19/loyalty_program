class LoyaltyReward < ApplicationRecord
  has_and_belongs_to_many :users

  enum :summery, [:free_coffee]
end
