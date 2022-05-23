class CreateLoyaltyPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_points do |t|
      t.integer :points
      t.datetime :expiry

      t.timestamps
    end
  end
end
