class RestorersController < ApplicationController

  def show
    @restorer = Restorer.find(params[:id])
    @restaurants = @restorer.restaurants
  end

end
