class ReservationsController < ApplicationController

  before_action :authenticate_restorer!

  def create
    @reservation = current_restorer.reservations.create(reservation_params)

    if @reservation.save
      ApplicationMailer.new_reservation(Restaurant.find(@reservation.restaurant_id), @reservation).deliver_now
      redirect_to @reservation.restaurant, notice: "Votre résérvation a bien été acceptée"
    end
  end

  def your_trips
    @trips = current_restorer.reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :time, :people, :restaurant_id)
  end

end
