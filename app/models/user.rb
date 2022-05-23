class User < ApplicationRecord
  has_many :transactions
  has_many :loyalty_points
  has_and_belongs_to_many :loyalty_rewards

  enum :tier, [:standard, :gold, :platinum]
end
