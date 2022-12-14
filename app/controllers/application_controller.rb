class ApplicationController < ActionController::Base
  devise_group :user, contains: %i[employee reviewer]

  before_action :configure_sign_up_parameters, if: :devise_controller?
  before_action :configure_sign_in_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account, :first_name, :last_name, :office_num])
  end

  def configure_sign_in_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:account, :password])
  end
end
