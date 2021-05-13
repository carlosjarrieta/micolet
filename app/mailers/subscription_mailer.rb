class SubscriptionMailer < ApplicationMailer
  def welcome_email(subscription)
    @subscription = subscription
    mail(to: @subscription.email, subject: I18n.t("presentation"))
  end
end
