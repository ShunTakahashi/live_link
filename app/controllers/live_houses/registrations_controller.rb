# frozen_string_literal: true

class LiveHouses::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :login_check, only: [:new]
  before_action :check_guest, only: %i[update destroy]

  # GET /resource/sign_up
  def new
    @live_house = LiveHouse.new
    @live_house.build_address
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tel, :prefecture,
  #                                                      address_attributes: %i[address latitude longitude]])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :tel, :prefecture,
  #                                                             address_attributes: %i[address latitude longitude]])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   live_house_path(@live_house.id)
  # end

  def after_update_path_for(resource)
    if @live_house.save
      live_house_path(@live_house.id)
    else
      render :edit
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def check_guest
    if resource.email == 'guest.live.house@example.com'
      redirect_to live_house_path(@live_house.id), notice: 'ゲストライブハウスの変更はできません。'
    end
  end
end
