class Api::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
		@articles = Article.all
		render json: @articles , each_serializer: ArticlesSerializer
  end


  def create
    # this is where we are
    article = @current_user.articles.create(article_params)
    # binding.pry
  end

  def update
    binding.pry
  end

  def show
		article = Article.find(params[:id])
		# render json: article, serializer: ArticlesSerializer
		render json: article.for_show_response.target!
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author_id)
  end
end