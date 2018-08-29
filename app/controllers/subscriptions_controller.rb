class SubscriptionsController < ApplicationController
  def create
    @nutritionist = Nutritionist.find(params[:nutritionist_id])
    new_sub = Subscription.new(user: current_user, nutritionist: @nutritionist)
    new_sub.save
    redirect_to new_meal_plan_path
  end
end
