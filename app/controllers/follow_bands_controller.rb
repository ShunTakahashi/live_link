class FollowBandsController < ApplicationController
  def create
    user = current_user
    band = Band.find(params[:band_id])
    if FollowBand.create(user_id: user.id, band_id: band.id)
      redirect_to bands_path
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    band = Band.find(params[:id])
    if folloe_band = FollowBand.find_by(user_id: user.id, band_id: band.id)
      folloe_band.delete
      redirect_to bands_path
    else
      redirect_to bands_path
    end
  end
end
