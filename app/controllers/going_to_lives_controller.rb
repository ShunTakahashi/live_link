class GoingToLivesController < ApplicationController

  def create
    user = current_user
    live = Live.find(params[:live_id])
    if GoingToLive.create(user_id: user.id, live_id: live.id)
      redirect_to lives_path
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    live = Live.find(params[:id])
    if going_to_live = GoingToLive.find_by(user_id: user.id, live_id: live.id)
      going_to_live.delete
      redirect_to lives_path
    else
      redirect_to lives_path
    end
  end
end
