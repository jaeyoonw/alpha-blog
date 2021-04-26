class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :show, :destroy]

  def show #articles/id 
  end 

  def index # articles 
    @articles = Article.all 
  end 

  def new # articles/new 
    @article = Article.new  #nil로 채워져있는 빈 오브젝트 생성 
  end 

  def create 
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end 
  end 

  def edit 
  end 

  def update 
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article 
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @article.destroy
    redirect_to articles_path
  end 

  private
  
  def set_article 
    @article = Article.find(params[:id])
  end 

  def article_params
    params.require(:article).permit(:title, :description) 
  end 
end 

