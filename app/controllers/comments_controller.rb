# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    article = Article.find(params[:article_id])

    comment = article.comments.create(comment_params.merge(user: current_user))

    if comment.persisted?
      flash[:notice] = 'Your comment was successfully submited'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
