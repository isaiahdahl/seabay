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
  def photo?(elm)
    if elm.img_url?
      elm.img_url
    else
      image_path "fisherman.jpg"
    end
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end
end
