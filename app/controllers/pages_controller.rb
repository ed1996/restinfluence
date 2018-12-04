class PagesController < ApplicationController

  def home
    @restaurants = Restaurant.order("RAND()").limit(3)
    # Attention la fonction RANDOM ne marche que sur heroku et pas en local il faut mettre RAND pour tester en local
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:restinfluence_search] = params[:search]
    end

    arrResult = Array.new

    if session[:restinfluence_search] && session[:restinfluence_search] != ""
      @restaurants_address = Restaurant.where(active: true).near(session[:restinfluence_search], 5, order:'distance')
    else
      @restaurants_address = Restaurant.where(active: true).all
    end

    @search = @restaurants_address.ransack(params[:q])
    @restaurants = @search.result

    @arrRestaurants = @restaurants.to_a

    not_available = Restaurant.where(active: true)

    if not_available.length > 0
      @arrRestaurants.delete(@restaurants)
    end

  end

  def searching
    @q = Restaurant.where(active: true, restaurant_type: params[:restaurant_type]).ransack(params[:q])
    @people = @q.result(distinct: true)
  end


end
