class SubscribersController < ApplicationController

  before_action :authenticate_restorer!

  def new

  end

  def update

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
                                   card: token,
                                   plan: 1020,
                                   email: current_restorer.email
    )

    current_restorer.subscribed = true
    current_restorer.stripeid = customer.id

    if current_restorer.save
      redirect_to root_path
    end

  end


end
