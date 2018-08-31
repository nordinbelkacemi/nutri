class MealPlan < ApplicationRecord
  has_many :meal_plan_meals, dependent: :destroy
  has_many :meals, through: :meal_plan_meals
  belongs_to :user

  before_create :assign_name

  def assign_name
    names = %w(nordin celine ovokojo)
    self.name = names.sample if self.name.blank?
  end
end
