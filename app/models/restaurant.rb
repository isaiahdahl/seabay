class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :fish_orders, dependent: :destroy
  accepts_nested_attributes_for :fish_orders, reject_if: :all_blank, allow_destroy: true
  has_many :fishes, through: :fish_orders

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
