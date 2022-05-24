class UsersTransactionsAssoc < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, foreign_key: true, index: true
  end
end
