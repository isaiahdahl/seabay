module ApplicationHelper

  def is_restaurant_owner?
    @restaurants = Restaurant.all
    @restaurants.each do |restaurant|
      if restaurant.user_id == current_user.id
        return restaurant
      end
    end
  end

end
