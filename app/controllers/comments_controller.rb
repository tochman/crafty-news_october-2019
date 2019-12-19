class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    article = Article.find(params[:article_id])
    
    comment = article.comments.create(body: comment_params[:body], user: current_user)

    if comment.persisted?
      flash[:notice] = "Commented"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
