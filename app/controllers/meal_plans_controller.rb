class MealPlansController < ApplicationController

  def index
    @meal_plans = MealPlan.all
  end

  def new
    if params[:nutritionist_id].nil?
      @nutritionist = Nutritionist.first
    else
      @nutritionist = Nutritionist.find(params[:nutritionist_id])
      puts "nutritionist -> #{@nutritionist.name}"
    end
  end
end
