class Transaction < ApplicationRecord
  belongs_to :user
  has_one :loyalty_point, dependent: :destroy

  validates :amount, numericality: { greater_than: 0 }

  after_save :evaluate_loyalty_points

  private

  def evaluate_loyalty_points
    return if amount < 100

    points_multiplier = (amount / 100).floor
    create_loyalty_point(points: points_multiplier * 10, user_id: user.id)
  end
end
