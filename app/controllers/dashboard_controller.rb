class DashboardController < ApplicationController
  def index
    @forums = Forum.all

    respond_to do |format|
      format.json { render json: @forums }
      format.html
    end
  end
end
