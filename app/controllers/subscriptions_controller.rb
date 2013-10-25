class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:notice] = "Thank you! We'll be in touch soon."
    else
      flash[:warning] = "Ouch, we couldn't save your email. Please try again later"
    end
    redirect_to :back
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
