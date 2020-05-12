class Api::ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
		@articles = Article.all
		render json: @articles , each_serializer: ArticlesSerializer
  end


  def create
    binding.pry
  end

  def update
    binding.pry
  end

  def show
		article = Article.find(params[:id])
		# render json: article, serializer: ArticlesSerializer
		render json: article.for_show_response.target!
  end
end