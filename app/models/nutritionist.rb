class Nutritionist < ApplicationRecord
  has_many :users, through: :subscriptions
  has_many :meals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :certificates, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  searchkick
end
