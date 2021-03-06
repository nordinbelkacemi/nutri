class NutritionistsController < ApplicationController
  before_action :set_nutritionist, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @nutritionists = Nutritionist.search_by_name_and_specialty(params[:query])
    else
      @nutritionists = Nutritionist.all
    end
  end

  def show
  end

  def new
    @nutritionist = Nutritionist.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  # def nutritionist_params
  #   prms = params.require(:nutritionist).permit(:name, :bio, :created_at, :updated_at, :NUTRITIONISTS_PHOTOS, :review, :certificate, :subscription, :meals)
  #   prms[:user_id] = current_user.id
  #   return prms
  # end

  def set_nutritionist
    @nutritionist = Nutritionist.find(params[:id])
  end
end
