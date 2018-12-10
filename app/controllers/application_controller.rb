class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :influencer, :linkinsta])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :avatar, :email, :password, :password_confirmation, :linkinsta, :verifyaccount, :numberfollower])
  end
end
