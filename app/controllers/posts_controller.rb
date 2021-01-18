class PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(id: :asc)
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_url, notice: "投稿が完了しました"
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "更新しました"
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_url, notice: "削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
