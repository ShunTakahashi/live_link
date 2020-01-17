class GoingToLivesController < ApplicationController

  def create
    going_to_live = current_user.going_to_lives.create(live_id: params[:live_id])
    redirect_to lives_path , notice: "#{going_to_live.live.title}さんの投稿にいいね！をしました"
  end

  def destroy
    going_to_live = current_user.going_to_lives.find_by(id: params[:id]).destroy
    redirect_to lives_path , notice: "#{going_to_live.live.title}さんの投稿のいいね！を取り消しました"
  end
  
end
