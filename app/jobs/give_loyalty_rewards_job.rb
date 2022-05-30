class GiveLoyaltyRewardsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.select(:id, 'SUM(loyalty_points.points) AS points')
                .joins(:loyalty_points)
                .where('points > 100')
                .where('loyalty_points.created_at': Time.zone.now.prev_month.beginning_of_month..Time.zone.now.prev_month.end_of_month)

    LoyaltyReward.free_coffee.first.users << users
  end
end
