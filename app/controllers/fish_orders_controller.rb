class FishOrdersController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fish = Fish.all
    @fish_order = FishOrder.new
  end

  def create
    @fish_order = FishOrder.new(fish_order_params)
    @fish_order.restaurant = Restaurant.find(params[:restaurant_id])
    if @fish_order.fish_id == nil
      flash[:alert] = "You didn't select any fish"
      redirect_to my_restaurant_restaurant_path(@fish_order.restaurant)
    else
      if FishOrder.where(fish_id: fish_order_params["fish_id"], restaurant_id: params[:restaurant_id]).any?
        flash[:alert] = "You already added this fish"
        redirect_to my_restaurant_restaurant_path(@fish_order.restaurant)
      else
        if @fish_order.save
          redirect_to my_restaurant_restaurant_path(@fish_order.restaurant)
        else
          render :new
        end
      end
    end
  end

  def destroy
    @fish_order = FishOrder.find(params[:id])
    @fish_order.destroy
    redirect_to my_restaurant_restaurant_path(@fish_order.restaurant)
  end

  private

  def fish_order_params
    params.require(:fish_order).permit(:fish_id, :weight_in_grams)
  end
end
