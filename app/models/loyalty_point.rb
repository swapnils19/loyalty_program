class LoyaltyPoint < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :user_transaction, class_name: 'Transaction', validate: true, foreign_key: :transaction_id

  validates :points, presence: true
  validate :new_loyaty_point?

  after_save :update_user_loyalty_tier

  private

  def update_user_loyalty_tier
    total_points = user.loyalty_points&.sum(:points)

    case total_points
    when 0..999
      user.tier = :standard
    when 1000..4999
      user.tier = :gold
    else
      user.tier = :platinum
    end

    user.save if user.changed?
  end

  def new_loyaty_point?
    errors.add(:points, 'Existing Loyalty Points can not be modified!') unless new_record?
  end
end
