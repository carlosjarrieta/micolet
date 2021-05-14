class GuestsController < ApplicationController
  def new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @email = subscription_params[:email]
    @user = User.find_by(email: @email)

    categories = params[:subscription][:category_ids].reject(&:empty?)

    if @user.nil?
      new_password = Devise.friendly_token.first(10)
      @user = User.new
      @user.password = new_password
      @user.email = @email
      if @user.save
        begin
          @subscription.user = @user
          @subscription.save!
          categories.each do |c|
            sc = SubscriptionCategory.new
            sc.subscription = @subscription
            sc.category_id = c.to_i
            sc.save
          end
          redirect_to root_path, notice: t(:notice_subscription)
          SubscriptionJob.perform_later(@subscription)
          sign_in @user
        rescue ActiveRecord::RecordInvalid => invalid
          redirect_to guests_new_path, alert: invalid.record.errors.full_messages[0]
        end
      end
      # si se encuentra el email
    else
      redirect_to new_user_session_path
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
