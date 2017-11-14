class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :fishorders, dependent: :destroy
  has_many :fishes, through: :fishorders

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
