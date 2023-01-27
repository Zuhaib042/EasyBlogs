class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.where(id: params[:id], author_id: params[:user_id]).first
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
 
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
