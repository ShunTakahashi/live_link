class BandsController < ApplicationController

  def index
    @q = Band.ransack(params[:q])
    @bands = @q.result.order(created_at: :desc)
  end

  def show
    @band = Band.find(params[:id])
    @follow_bands = @band.band_to_user.count
    @lives = @band.lives.all
  end
end
