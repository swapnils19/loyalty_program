class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :loyalty_points, dependent: :destroy
  has_and_belongs_to_many :loyalty_rewards, dependent: :destroy

  enum :tier, [:standard, :gold, :platinum]

  def self.login(user_name)
    where(name: user_name).take
  end
end
