class BandsController < ApplicationController
  PER = 10

  def index
    @q = Band.ransack(params[:q])
    @bands = @q.result.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def show
    @band = Band.find(params[:id])
    @follow_bands = @band.band_to_user.count
    @lives = @band.lives.all
  end
end
