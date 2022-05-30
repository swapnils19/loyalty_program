require "rails_helper"

RSpec.describe Transaction, type: :model do
  context 'loyalty points evaluation' do
    def create_user_with_transactions(amount = 0)
      user = User.create
      user.transactions.create(amount: amount) if amount > 0
      user.reload
    end

    it "doesn't create loyalty points for amount less than 100" do
      user = create_user_with_transactions(99)
      expect(user.transactions.count).to be(1)
      expect(user.loyalty_points.count).to be(0)
    end

    it 'adds 10 loyalty points for amount less than 200' do
      user = create_user_with_transactions(199)
      expect(user.loyalty_points.count).to be(1)
      expect(user.loyalty_points.first.points).to be(10)
    end

    it 'adds 50 loyalty points for amount 500' do
      user = create_user_with_transactions(500)
      expect(user.loyalty_points.count).to be(1)
      expect(user.loyalty_points.first.points).to be(50)
    end
  end
end
