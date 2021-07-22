class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new 
    @category = Category.new
  end 

  def create 
    @category = Category.new(category_params)
    if @category.save 
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else 
      render 'new'
    end 
  end 

  def edit 
    @category = Category.find(params[:id]) # edit창을 불러오면서 내가 수정하고싶은 카테고리의 데이터를 가져온다. 
  end 

  def update 
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else 
      render 'edit'
    end 
  end 

  def index 
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end 

  def show 
    @category = Category.find(params[:id]) # @category는 카테고리 뷰에서 내가 클릭한 카테고리
    @articles = @category.articles.paginate(page: params[:page], per_page: 5) # 그 카테고리로 지정된 모든 article들을 꺼낸다. 
  end 

  private 

  def category_params
    params.require(:category).permit(:name)
  end 

  def require_admin 
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end 
  end
end  