class ForumsController < ApplicationController
  # before_action :set_forums, only: [:index]
  
  def index
    @forums = Forum.all
  end

  private
    def set_forums
      @forums = Forum.where(is_active: true).limit(10).order(updated_at: :desc)
    end
end
