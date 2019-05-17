class CommentsController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.new comment_params

    byebug

    if @comment.save
      redirect_to @post, notice: "Comment created"
    else
      pp @comment.errors
      redirect_to @post, notice: "There was an error creating the comment: #{@comment.errors.full_messages}"
    end

  end

  def destroy
    Comment.find(params[:id]).destroy

    redirect_to post_url(params[:post_id]), notice: "Comment was deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
