class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments.all
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.create(
      text: comment_params[:text],
      author_id: params[:user_id],
      post_id: params[:post_id]
    )

    render json: @comment, status: :created
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
