require "rails_helper"

RSpec.describe User, type: :model do
  context 'assign loyalty' do
    def create_user_with_transactions(amount = 0)
      user = User.create
      user.transactions.create(amount: amount) if amount > 0
      user.reload
    end

    it "doesn't update default loyalty tier" do
      user = create_user_with_transactions
      expect(user.tier).to eq(User.tiers.key(0))
    end

    it "doesn't update default loyalty tier for insufficient points" do
      user = create_user_with_transactions(100)
      expect(user.tier).to eq(User.tiers.key(0))
    end

    it 'updates loyalty tier to Gold' do
      user = create_user_with_transactions(10000)
      expect(user.tier).to eq(User.tiers.key(1))
    end

    it 'updates loyalty tier to Platinum' do
      user = create_user_with_transactions(50000)
      expect(user.tier).to eq(User.tiers.key(2))
    end
  end
end
