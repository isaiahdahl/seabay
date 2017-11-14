module ApplicationHelper

  def is_restaurant_owner?
    @resto = Restaurant.where( user_id: current_user.id)
  end

end
