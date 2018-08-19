class Meal < ApplicationRecord
  belongs_to :nutritionist
  belongs_to :meal_plan
  has_many :doses
end
