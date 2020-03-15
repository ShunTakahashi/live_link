class RootController < ApplicationController
  def index
    redirect_to lives_path if current_user || current_band || current_live_house != nil
  end
end
