# frozen_string_literal: true

class LiveHouses::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new_guest
    live_house = LiveHouse.guest
    sign_in live_house
    redirect_to root_path, success: 'ゲストライブハウスとしてログインしました。'
    @live_house = live_house.id
    Address.guest(@live_house)
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
