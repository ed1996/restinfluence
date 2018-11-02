class RestorersController < ApplicationController

  def show

    @restorer = Restorer.find(params[:id])

  end

end
