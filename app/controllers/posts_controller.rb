class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(**post_params, author_id: current_user.id)
    @user = current_user

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to user_posts_path, notice: 'Post was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
