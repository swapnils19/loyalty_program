class CreateLoyaltyRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_rewards do |t|
      t.string :reward

      t.timestamps
    end
  end
end
