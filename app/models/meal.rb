class Meal < ApplicationRecord
  belongs_to :nutritionist
  has_many :meal_plan_meals, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  self.inheritance_column = :_type_disabled
end
