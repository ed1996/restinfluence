class DemandsController < ApplicationController

  def your_reservation
    @restaurants = current_restorer.restaurants
  end

end
