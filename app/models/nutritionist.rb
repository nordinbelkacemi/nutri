class Nutritionist < ApplicationRecord
  has_many :users, through: :subscriptions
  has_many :meals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :certificates, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def subscribed?
    self.subscriptions.count > 0
  end

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
