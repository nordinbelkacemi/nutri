class MealPlan < ApplicationRecord
  has_many :meal_plan_meals, dependent: :destroy
  has_many :meals, through: :meal_plan_meals
  belongs_to :user
end
