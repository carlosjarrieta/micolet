# == Schema Information
#
# Table name: subscription_categories
#
#  id              :integer          not null, primary key
#  category_id     :integer
#  subscription_id :integer
#
# Indexes
#
#  index_subscription_categories_on_category_id      (category_id)
#  index_subscription_categories_on_subscription_id  (subscription_id)
#
class SubscriptionCategory < ApplicationRecord
  belongs_to :subscription
  belongs_to :category

  validates_uniqueness_of :subscription_id, scope: :category_id
end
