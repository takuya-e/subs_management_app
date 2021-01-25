class HomesController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc).limit(3)
  end
end
