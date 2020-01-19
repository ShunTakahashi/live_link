class LiveHousesController < ApplicationController
  def show
    @live_house = LiveHouse.find(params[:id])
  end
end
