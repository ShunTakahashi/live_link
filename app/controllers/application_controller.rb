class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?




  protected

  def login_check
    redirect_to lives_path if current_user || current_band || current_live_house != nil
  end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name ticket_name avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name ticket_name avatar])
    elsif resource_class == Band
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name prefecture avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name prefecture avatar])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tel, :prefecture,
                                                         address_attributes: %i[address latitude longitude]])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :tel, :prefecture,
                                                                address_attributes: %i[address latitude longitude]])
    end
  end
end
