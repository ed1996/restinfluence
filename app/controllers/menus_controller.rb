class MenusController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.create(menu_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @menu = Menu.find(params[:id])
    restaurant = @menu.restaurant
    @menu.destroy
    redirect_to restaurant
  end

  private
  def menu_params
    params.require(:menu).permit(:category, :title, :content, :price_menu, :restaurant_id)
  end

end
