class User < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :loyalty_points, dependent: :destroy
  has_and_belongs_to_many :loyalty_rewards, dependent: :destroy

  enum :tier, [:standard, :gold, :platinum]

  before_save :update_loyalty_tier

  def self.login(user_name)
    where(name: user_name).take
  end

  private

  def update_loyalty_tier
    total_points = loyalty_points&.sum(:points)

    case
    when total_points >= 1000
      self.tier = :gold
    when total_points >= 5000
      self.tier = :platinum
    else
      self.tier = :standard
    end
  end
end
