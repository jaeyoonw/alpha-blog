class ArticlesController < ApplicationController
  def show #articles/id 
    @article = Article.find(params[:id])
  end 

  def index # articles 
    @articles = Article.all 
  end 

  def new # articles/new 
    @article = Article.new  #nil로 채워져있는 빈 오브젝트 생성 
  end 

  def create 
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end 
  end 

  def edit 
    @article = Article.find(params[:id])
  end 

  def update 
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article 
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end 

end 

