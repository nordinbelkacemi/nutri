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

  include PgSearch
  pg_search_scope :search_by_name_and_specialty,
    against: [ :name, :specialty ],
    using: {
      tsearch: { prefix: true }
    }
end
