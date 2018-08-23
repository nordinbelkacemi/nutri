class Meal < ApplicationRecord
  belongs_to :nutritionist
  belongs_to :meal_plan, optional: true
  has_many :ingredients, dependent: :destroy
  self.inheritance_column = :_type_disabled

  mount_uploader :photo, PhotoUploader
end

