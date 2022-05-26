class LoyaltyPoint < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :user_transaction, class_name: 'Transaction', validate: true, foreign_key: :transaction_id

  validates :points, presence: true
end
