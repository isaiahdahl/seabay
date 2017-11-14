class Fish < ApplicationRecord
  has_many :fish_orders

  validates :name, presence: true, uniqueness: true
end
