class ReservationsController < ApplicationController

  before_action :authenticate_influencer!

  def create
    @reservation = current_influencer.reservations.create(reservation_params)
    redirect_to @reservation.restaurant, notice: "Votre résérvation a bien été acceptée"
  end

  def your_trips
    @trips = current_influencer.reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :time, :people, :restaurant_id)
  end

end
