class FishOrdersController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fish = Fish.all
    @fish_order = FishOrder.new
  end

  def create
    @fish_order = FishOrder.new(fish_order_params)
    @fish_order.restaurant = Restaurant.find(params[:restaurant_id])
    if @fish_order.save
      redirect_to restaurant_path(@fish_order.restaurant)
    else
      render :new
    end
  end

  def destroy
    @fish_order = FishOrder.find(params[:id])
    @fish_order.destroy
    redirect_to restaurant_path(@fish_order.restaurant_id)
  end

  private

  def fish_order_params
    params.require(:fish_order).permit(:fish_id)
  end
end
