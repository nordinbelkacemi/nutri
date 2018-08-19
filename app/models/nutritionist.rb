class Nutritionist < ApplicationRecord
  has_many :meals
  belongs_to :subscription
  has_many :reviews
end
