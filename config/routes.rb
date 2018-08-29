Rails.application.routes.draw do
  devise_for :users

  resources :nutritionists, only: [:index, :show] do
    resources :meals, only: [:show]
  end
  resources :meals, only: [:index]
  resources :subscriptions, only: [:create, :destroy]
  resources :meal_plans, only: [:index, :new, :create, :show]

  root to: 'nutritionists#index'
end


# "See more" link on meal_plans#create...
# what should I redirect to?


# indexing all meals
# @nutritionists = current_user.nutritionists
#
