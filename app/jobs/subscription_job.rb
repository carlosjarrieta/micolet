class SubscriptionJob < ApplicationJob
  queue_as :default

  def perform(subscription)
    SubscriptionMailer.welcome_email(subscription).deliver
  end
end
