class FishOrder < ApplicationRecord
  belongs_to :fish
  belongs_to :restaurant

  validates :restaurant, presence: true, uniqueness: { scope: :fish}
  validates :fish, presence: true, uniqueness: { scope: :restaurant}
end
