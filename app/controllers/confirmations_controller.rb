class ConfirmationsController < Devise::ConfirmationsController

  private
  def after_confirmation_path_for(resource_name, resource)
    edit_restorer_registration_path
  end

end
