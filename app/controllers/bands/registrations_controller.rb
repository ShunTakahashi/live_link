# frozen_string_literal: true

class Bands::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :login_check, only: [:new]
  before_action :check_guest, only: %i[update destroy]

  # GET /resource/sign_up
  # def new
  #   super
  # end

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
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name prefecture avatar])
  # end
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[name prefecture avatar])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   band_path(@band.id)
  # end

  def after_update_path_for(resource)
    if @band.save
      band_path(@band.id)
    else
      render :edit
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def check_guest
    if resource.email == 'guestband@example.com'
      redirect_to band_path(@band.id), notice: 'ゲストバンドの変更はできません。'
    end
  end
end
