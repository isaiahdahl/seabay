class FishordersController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @fish = Fish.all
    @fishorder = FishOrder.new
  end

  def create
    @fishorder = FishOrder.new(fish_order_params)
    @fishorder.restaurant = Restaurant.find(params[:restaurant_id])
    if @fishorder.save
      redirect_to restaurant_path(@fishorder.restaurant)
    else
      render :new
    end
  end

  def destroy
    @fishorder = FishOrder.find(params[:id])
    @fishorder.destroy
    redirect_to :back
  end

  private

  def fish_order_params
    params.require(:fishorder).permit(:fish_id)
  end
end
