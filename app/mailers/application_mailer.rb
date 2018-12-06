class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_reservation(restaurant, reservation)
    @restorer = Restorer.find(restaurant.restorer_id)
    @reservation = reservation
    @restaurant = restaurant
    mail(from: 'RestInfluence <no-reply@restinfluence.com>', to: @restorer.email, subject: "Nouvelle réservation !")
  end
end
