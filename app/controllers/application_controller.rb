class ApplicationController < ActionController::Base  
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    new_address_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_address_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:last_name,:real_name,:last_name_read,:real_name_read,:birthday])
  end
end
