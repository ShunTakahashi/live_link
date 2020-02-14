class LivesController < ApplicationController
  before_action :set_live, only: %i[show edit update destroy]

  def index
    @q = Live.includes(:act, :place).ransack(params[:q])
    @lives = @q.result.order(created_at: :desc)
    # byebug
  end

  def show; end

  def new
    if params[:back]
      @live = Live.new(live_params)
    else
      @live = Live.new
      @live.act.build
      @live.place.build
    end
  end

  def edit; end

  def create
    @live = current_band.lives.build(live_params)
    @live.place.each do |place|
      if LiveHouse.find_by(name: place.name) != nil
        live_house = LiveHouse.find_by(name: place.name)
        place.place_urls.build(live_house_id: live_house.id)
        place.url = live_house_path(live_house.id)
      end
    end

    @live.act.each do |act|
      if Band.find_by(name: act.name) != nil
        band = Band.find_by(name: act.name)
        band.act_urls.build(band_id: band.id)
        act.url = band_path(band.id)
      end
    end
    if @live.save
      redirect_to lives_path, notice: "投稿が完了しました。"
    else
      render new_live_path
    end
  end

  def destroy
    @live.destroy
    redirect_to lives_path, notice: "投稿を削除しました。"
  end

  def update
    if @live.update(live_params)
      redirect_to lives_path, notice: "編集が完了しました"
    else
      render 'edit'
    end
  end

  private

  def set_live
    @live = Live.find(params[:id])
  end

  def live_params
    params.require(:live).permit(:title, :date, :open_time, :start_time,
                                 :end_time, :early_bird_ticket_price,
                                 :tickets_for_today_price, :image, :image_cache,
                                 :time_table_image, :time_table_image_cache,
                                 :remarks, :status,
                                 act_attributes: %i[name url],
                                 place_attributes: %i[name url])
  end

end

