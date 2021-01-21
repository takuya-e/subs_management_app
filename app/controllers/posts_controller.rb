class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @subscriptions = Subscription.all
  end

  def create
    @post = current_user.posts.new(content: post_params[:content], user_id: post_params[:user_id], subscription_id: post_params[:subscription_id])

    if @post.save
      redirect_to @post, notice: "投稿が完了しました"
    else
      render :new
    end
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
    params.require(:post).permit(:content, :user_id, :subscription_id)
  end
end
