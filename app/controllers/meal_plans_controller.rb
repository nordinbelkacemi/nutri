class MealPlansController < ApplicationController
  before_action only: [:edit, :update, :destroy]

  def index
    @meal_plans = current_user.meal_plans
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
    # creating the meal plan
    daily_calories = 0
    [:breakfast, :lunch, :dinner].each do |i|
      daily_calories += Meal.find(params[i]).calories
    end

    @meal_plan = MealPlan.new(user: current_user, daily_calories: daily_calories, name: params[:meal_plan_name])
    @meal_plan.save!



    # creating the meal plan meals
    @meal_plan_meals = []
    [:breakfast, :lunch, :dinner].each do |i|
      @meal_plan_meals << MealPlanMeal.new(meal: Meal.find(params[i]), meal_plan: @meal_plan)
    end

    @meal_plan_meals.each do |meal_plan_meal|
      meal_plan_meal.save!
    end

    # go back to your meal plans index page
    redirect_to meal_plans_path
  end

  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy
    redirect_to meal_plans_path
  end

end
