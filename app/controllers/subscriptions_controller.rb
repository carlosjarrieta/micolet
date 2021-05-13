class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    categories = params[:subscription][:category_ids].reject(&:empty?)

    begin
      @subscription.save!
      categories.each do |c|
        sc = SubscriptionCategory.new
        sc.subscription = @subscription
        sc.category_id = c.to_i
        sc.save
      end
      redirect_to root_path, notice: t(:notice_subscription)
      SubscriptionJob.perform_later(@subscription)
    rescue ActiveRecord::RecordInvalid => invalid
      redirect_to new_subscription_path, alert: invalid.record.errors.full_messages[0]
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
