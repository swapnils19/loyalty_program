class LoyaltyPoint < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :user_transaction, class_name: 'Transaction', validate: true, foreign_key: :transaction_id

  validates :points, presence: true

  after_save :update_user

  private

  def update_user
    user.save
  end
end
