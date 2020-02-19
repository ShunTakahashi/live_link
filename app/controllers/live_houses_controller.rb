class LiveHousesController < ApplicationController

  def index
    @q = LiveHouse.ransack(params[:q])
    @live_houses = @q.result.order(created_at: :desc)
  end

  def show
    @live_house = LiveHouse.find(params[:id])
    @place_url = @live_house.live_house_to_places.all.pluck(:live_id)
    @lives = [Live.find(@place_url.first)] unless @place_url == []
  end
end
