class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_url, notice: "投稿が完了しました"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "更新しました"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_url, notice: "削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
