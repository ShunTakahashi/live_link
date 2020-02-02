class BandsController < ApplicationController

  def index
    @q = Band.ransack(params[:q])
    @bands = @q.result.order(created_at: :desc)
  end

  def show
    @band = Band.find(params[:id])
  end
end
