class FollowBandsController < ApplicationController
  def create
    user = current_user
    band = Band.find(params[:band_id])
    if FollowBand.create(user_id: user.id, band_id: band.id)
      redirect_to band_path(band), success: 'フォローが完了しました'
    else
      render band_path(band), danger: 'エラーが発生しました'
    end
  end

  def destroy
    user = current_user
    band = Band.find(params[:id])
    if folloe_band = FollowBand.find_by(user_id: user.id, band_id: band.id)
      folloe_band.delete
      redirect_to band_path(band), danger: 'フォローを解除しました'
    else
      redirect_to band_path(band), danger: 'エラーが発生しました'
    end
  end
end
