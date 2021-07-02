class ArticlesController < ApplicationController
  # index, new, create 는 제외 
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show #articles/id 
  end 

  def index # articles 
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end 

  def new # articles/new
    @article = Article.new  #nil로 채워져있는 빈 오브젝트 생성 
  end 

  def create
    @article = Article.new(article_params)
    #@article.user = User.second  janedoe3 
    @article.user = current_user
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
    params.require(:article).permit(:title, :description) # 화이트 리스트 등록
  end
  
  def require_same_user # 이 액션은 articles에만 해당되므로 application_controller에 추가 하지 않고 여기에다 추가한다. 
    if @article.user != current_user && !current_user.admin?
      # 내 게시글이 아님과 동시에 어드민이 아니면 => 내가 쓴 게시글이거나, 어드민이면 수정 가능하다. 
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end 
  end 
end 

