class NutritionistsController < ApplicationController

  def index
    @nutritionists = Nutritionist.all
  end

end
