class MealPlansController < ApplicationController
  before_action :set_meal_plans, only: [:edit, :update, :destroy]

  def index
    @meal_plans = MealPlan.all
  end

  # def new
  #   @meal = meal.find(params[:meal_id])
  #   @meal_plan = meal_plan.new
  # end

  def show
    @meal_plan = MealPlan.find(params[:id])
    @calories = []
    @meal_plan.meals.each do |meal|
      @calories << meal.calories
    end
  end

  # def create
  #   @meal_plan = Meal_plan.new(meal_plan_params)
  #   @meal_plan.save!
  #   redirect_to meals_path
  # end
end
#   def edit
#   end

#   def update
#     if params[:status] == "true"
#       @meal_plan.update(accepted: true)
#     elsif params[:status] == "false"
#       @meal_plan.update(accepted: false)
#     else
#       @meal_plan.update(meal_plan_params_update)
#     end
#     redirect_to meal_plans_path
#   end

#   def destroy
#     @meal_plan.destroy
#     redirect_to meal_plans_path
#   end

#   private

#   def booking_params
#     prms = params.require(:meal_plan).permit("day(1i)", "day(2i)", "day(3i)")
#     date = DateTime.parse("#{prms['day(1i)']}/#{prms['day(2i)']}/#{prms['day(3i)']}")
#     return {
#       day: date,
#       user_id: current_user.id,
#       meal_plan_id: params[:meal_plan_id],
#       created_at: DateTime.now
#     }
#   end


#   def meal_plan_params_update
#     prms = params.require(:meal_plan).permit("day(1i)", "day(2i)", "day(3i)")
#     date = DateTime.parse("#{prms['day(1i)']}/#{prms['day(2i)']}/#{prms['day(3i)']}")
#     return {
#       day: date,
#       updated_at: DateTime.now
#     }
#   end


#   def set_booking
#     @meal_plan = Meal_plan.find(params[:id])
#   end
# end












