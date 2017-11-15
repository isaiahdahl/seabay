module ApplicationHelper

  def is_restaurant_owner?
    @resto = Restaurant.where( user_id: current_user.id)
  end

  def photo?(elm)
    if elm.img_url?
      elm.img_url
    else
      image_path "fisherman.jpg"
    end
  end

end
