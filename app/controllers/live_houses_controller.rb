class LiveHousesController < ApplicationController
  PER = 10

  def index
    @q = LiveHouse.ransack(params[:q])
    @live_houses = @q.result.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def show
    @live_house = LiveHouse.find(params[:id])
    @place_url = @live_house.live_house_to_places.all.pluck(:live_id)
    @lives = Live.all.find(@place_url)
    gon.address = @live_house.name
    gon.latitude = @live_house.address.latitude
    gon.longitude = @live_house.address.longitude
  end
end
