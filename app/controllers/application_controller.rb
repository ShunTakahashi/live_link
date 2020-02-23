class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #
  # # def devise_parameter_sanitizer
  # #   if resource_class == User
  # #     # User::ParameterSanitizer.new(User, :user, keys: [:name, :ticket_name, :avatar])
  # #   else
  # #     super # Use the default one
  # #   end
  # # end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(name ticket_name avatar))
    elsif resource_class == Band
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(name prefecture avatar))
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(name tel prefecture address_attributes: %i(address latitude longitude)))
    end
  end
end
