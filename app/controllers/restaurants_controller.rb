class RestaurantsController < ApplicationController
  require "instagram_api_client"

  before_action :set_restaurant, only: [:show, :edit, :update]
  before_action :authenticate_restorer!, except: [:show]
  before_action :require_same_restorer, only: [:edit, :update]


  def index
    @restaurants = current_restorer.restaurants
  end

  def new
    @restaurant = current_restorer.restaurants.build
  end

  def create
    @restaurant = current_restorer.restaurants.build(restaurant_params)
    if @restaurant.save
      if params[:images]
        params[:images].each do |i|
          @restaurant.photos.create(image: i)
        end
      end
      @photos = @restaurant.photos
      redirect_to edit_restaurant_path(@restaurant), notice:"Votre restaurant a été ajouté avec succés"
    else
      render :new
    end
  end

  def show
    @photos = @restaurant.photos
    @menus = @restaurant.menu
  end

  def edit
    @photos = @restaurant.photos
  end

  def update
    if @restaurant.update(restaurant_params)
      if params[:images]
        params[:images].each do |i|
          @restaurant.photos.create(image: i)
        end
      end
      redirect_to edit_restaurant_path(@restaurant), notice:"Modification enregistrée..."
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

  def require_same_user
    if current_restorer.id != @restaurant.restorer_id
      flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
      redirect_to root_path
    end
  end

end
