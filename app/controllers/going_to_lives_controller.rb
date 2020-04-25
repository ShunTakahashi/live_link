class GoingToLivesController < ApplicationController

  def create
    user = current_user
    live = Live.find(params[:live_id])
    if GoingToLive.create(user_id: user.id, live_id: live.id)
      redirect_to live_path(live), success: '行く予定リストにライブを追加しました'
    else
      render live_path(live), danger: 'エラーが発生しました'
    end
  end

  def destroy
    user = current_user
    live = Live.find(params[:id])
    if going_to_live = GoingToLive.find_by(user_id: user.id, live_id: live.id)
      going_to_live.delete
      redirect_to live_path(live), danger: '行く予定リストからライブを削除しました'
    else
      redirect_to live_path(live), danger: 'エラーが発生しました'
    end
  end
end
