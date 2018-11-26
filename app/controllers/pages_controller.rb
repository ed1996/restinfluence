class PagesController < ApplicationController

  def home
    @restaurants = Restaurant.order("RANDOM()").limit(3)
  end

  def search
    if params[:search].present? && params[:search].strip != "" && params[:restaurant_type].present?
      session[:restinfluence_search] = params[:search]
    end

    arrResult = Array.new

    if session[:restinfluence_search] && session[:restinfluence_search] != ""
      @restaurants_address = Restaurant.where(active: true, restaurant_type: params[:restaurant_type]).near(session[:restinfluence_search], 5, order:'distance')
    else
      @restaurants_address = Restaurant.where(active: true).all
    end

    @search = @restaurants_address.ransack(params[:q])
    @restaurants = @search.result

    @arrRestaurants = @restaurants.to_a



  end


end
