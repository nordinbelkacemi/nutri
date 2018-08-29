class MealPlansController < ApplicationController
  before_action :set_meal_plans, only: [:edit, :update, :destroy]

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

  def show
    @meal_plan = MealPlan.find(params[:id])
    @calories = []
    @meal_plan.meals.each do |meal|
      @calories << meal.calories
    end
  end

  def create
    
    @meal_plan = MealPlan.new()
  end
end
