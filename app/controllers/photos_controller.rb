class PhotosController < ApplicationController

  def destroy

    @photo = Photo.find(params[:id])
    restaurant = @photo.restaurant

    @photo.destroy

    @photos = Photo.where(restaurant_id: restaurant_id)

    respond_to :js
  end

end
