class UsersLoyaltyPtAssoc < ActiveRecord::Migration[7.0]
  def change
    add_reference :loyalty_points, :users, foreign_key: true, index: true
  end
end
