class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to user_post_path(@like.author, @like.post)
    else
      redirect_to user_post_path(@like.author, @like.post)
    end
  end
end
# "/users/#{@like.author_id}/posts/#{@like.post_id}"