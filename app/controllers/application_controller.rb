class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     # User::ParameterSanitizer.new(User, :user, keys: [:name, :ticket_name, :avatar])
  #   else
  #     super # Use the default one
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ticket_name, :avatar])
  end
end
