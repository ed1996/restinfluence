class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update]
  before_action :authenticate_restorer!, except: [:show]

  def index
    @restaurants = current_restorer.restaurants
  end

  def new
    @restaurant = current_restorer.restaurants.build
  end

  def create
    @restaurant = current_restorer.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice:"Votre restaurant a été ajouté avec succés"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice:"Modification enregistrée..."
    else
      render :edit
    end
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_type, :summary, :address, :reduction, :price, :active)
  end

end
