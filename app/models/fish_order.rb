class FishOrder < ApplicationRecord
  belongs_to :fish
  belongs_to :restaurant
end
