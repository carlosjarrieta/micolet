class SubscriptionCategory < ApplicationRecord
  belongs_to :subscription
  belongs_to :category

  validates_uniqueness_of :subscription, scope: category_id
end
