class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.where(id: params[:id], author_id: params[:user_id]).first
  end
end
