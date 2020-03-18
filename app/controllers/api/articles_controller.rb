class Api::ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
    @articles = Article.all
  end


  def create
    binding.pry
  end

  def update
    binding.pry
  end

  def show
		@article = Article.find(params[:id])
  end
end