class ApplicationController < ActionController::Base
  before_action :configured_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

  protected

  def after_sign_in_path_for(resource)
    users_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configured_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
