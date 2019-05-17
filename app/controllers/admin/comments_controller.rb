class Admin::CommentsController < Admin::BaseController

  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def destroy
    Comment.find(params[:id]).destroy

    redirect_to admin_comments_url
  end

end
