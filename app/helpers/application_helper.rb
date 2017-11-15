module ApplicationHelper

  def is_restaurant_owner?
    @resto = Restaurant.all
    my_restaurant = []
    @resto.each do |restaurant|
      if restaurant.user_id == current_user.id
        my_restaurant << restaurant
      end
    end
    my_restaurant.first
  end
end
