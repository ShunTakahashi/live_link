class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]

  def index
    @lives = Live.all
  end

  def show
  end

  def new
    if params[:back]
      @live = Live.new(live_params)
    else
      @live = Live.new
      @live.act.build
    end
  end

  def edit
  end

  def create
    @live = current_band.lives.build(live_params)
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
                                 act_attributes: [:name, :url])
  end

end

