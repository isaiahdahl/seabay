class Fish < ApplicationRecord Devise::UsersController
  has_many :fish_orders

  validates :name, presence: true, uniqueness: true
end
