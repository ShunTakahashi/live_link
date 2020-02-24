class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow_bands = current_user.user_to_bands.count
    @going_to_lives = current_user.user_to_lives.all
  end

  def follow_band_page
    @follow_bands = current_user.user_to_bands.all
  end
end
