# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    authorize(@article)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params.merge(author: current_user))
    if article.persisted?
      redirect_to article, notice: 'Article was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize(@article)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
