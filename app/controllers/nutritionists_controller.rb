class NutritionistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @nutritionists = Nutritionist.search(params[:query]).results
    else
      @nutritionists = Nutritionist.all
    end
  end

end
