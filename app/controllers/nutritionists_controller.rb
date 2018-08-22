class NutritionistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @nutritionists = Nutritionist.all
  end

end
