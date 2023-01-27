class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]

    return unless @like.save

    redirect_to user_post_path(@like.author, @like.post)
  end
end
