class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
    # hit the api with this meal to get the recEdamamService(@meal).call
    @ingredients = @meal.ingredients
    @suggestions = @meal.nutritionist.meals.where.not(id: @meal.id).limit(3)
  end

  private

end
