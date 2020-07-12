class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article was deleted!"
      redirect_to @article
    else
      flash[:notice] = 'Delete unsuccessful!'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"
    redirect_to article_path(@article)
  end
end
