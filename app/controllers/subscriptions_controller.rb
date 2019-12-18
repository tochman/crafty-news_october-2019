class SubscriptionsController < ApplicationController
  def new
    @article = Article.find(params[:record])
  end

  def create
    current_user.update_attribute(:subscriber, true)
    article = Article.find(params[:article_id])
    redirect_to article_path(article), notice: 'Thank you for becoming a subscriber'
  end
end
