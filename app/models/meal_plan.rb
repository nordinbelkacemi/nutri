class MealPlan < ApplicationRecord
  has_many :meals
  belong_to :user
end
