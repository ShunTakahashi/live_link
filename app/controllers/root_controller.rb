class RootController < ApplicationController
  before_action :login_check, only: [:index]

  def index; end
end
