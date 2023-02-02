class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
      flash[:success] = 'Comment added successfully'
    else
      @user = Post.find(params[:user_id])
      @post = Post.find(params[:post_id])
      flash.now[:error] = 'Error: Comment could not be deleted'
      redirect_to user_post_path(@user, @post)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to user_post_path
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
    end
  end 


  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
