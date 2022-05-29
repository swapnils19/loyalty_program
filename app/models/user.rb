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

    case total_points
    when 0..999
      self.tier = :standard
    when 1000..4999
      self.tier = :gold
    else
      self.tier = :platinum
    end
  end
end
