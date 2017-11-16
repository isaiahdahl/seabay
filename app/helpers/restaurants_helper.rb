module RestaurantsHelper
  def compare(restaurant)
    @orders = []
    @search = []
    restaurant.fish_orders.each { |order| @orders << order.fish_id }
    @fishes = Fish.all
    match_params = params.select { |key, value| value == "1" }
    fish_hash = match_params.each { |fish| fish }
    fish_hash.select do |key, value|
      fish_object = Fish.where(name: key)
      @search << fish_object.first.id
    end
    @intersection = @orders & @search
    @intersection
  end
end
