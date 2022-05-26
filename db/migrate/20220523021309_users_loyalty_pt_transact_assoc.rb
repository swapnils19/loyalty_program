class UsersLoyaltyPtTransactAssoc < ActiveRecord::Migration[7.0]
  def change
    add_reference :loyalty_points, :user, foreign_key: true, index: true
    add_reference :loyalty_points, :transaction, foreign_key: true, index: true
    add_reference :transactions, :user, foreign_key: true, index: true
  end
end
