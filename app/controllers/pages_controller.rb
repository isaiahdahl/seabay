class PagesController < ApplicationController
  def home
    @array = ["Fish To Table", "Fish To Restaurants", "Fish To You"]
    @rest = Restaurant.all
    @restaurants = @rest[3,3]
  end
end
