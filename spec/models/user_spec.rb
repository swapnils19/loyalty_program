require "rails_helper"

RSpec.describe User, type: :model do
  context "assign loyalty" do
    it "update loyalty tier" do
      user = User.create
      expect(user.tier).to eq(User.tiers.key(0))

      user.transactions.create(amount: 100)
      user.reload
      expect(user.tier).to eq(User.tiers.key(0))

      user.transactions.create(amount: 10000)
      user.reload
      expect(user.tier).to eq(User.tiers.key(1))

      user.transactions.create(amount: 50000)
      user.reload
      expect(user.tier).to eq(User.tiers.key(2))
    end
  end
end
