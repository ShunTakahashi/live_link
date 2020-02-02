class LiveHousesController < ApplicationController

  def index
    @q = LiveHouse.ransack(params[:q])
    @live_houses = @q.result.order(created_at: :desc)
    # @live_houses = LiveHouse.all
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end
end
