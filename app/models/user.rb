class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :subscriptions
  has_many :meal_plans
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
