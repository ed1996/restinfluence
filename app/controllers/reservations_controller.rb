class ReservationsController < ApplicationController

  before_action :authenticate_restorer!

  def create
    @reservation = current_restorer.reservations.create(reservation_params)
    redirect_to @reservation.restaurant, notice: "Votre résérvation a bien été acceptée"
  end

  def your_trips
    @trips = current_restorer.reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :time, :people, :restaurant_id)
  end

end
