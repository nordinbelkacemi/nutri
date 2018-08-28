class MealPlansController < ApplicationController
  before_action :set_meal_plans, only: [:edit, :update, :destroy]

  def index
    @meal_plans = MealPlan.all
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
    @calories = []
    @meal_plan.meals.each do |meal|
      @calories << meal.calories
    end
  end
end









