class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, ]

  def index 
    @users = User.paginate(page: params[:page], per_page: 5)  # 1 page에 게시물이 5개 이상인 경우 페이지가 생겨남.
  end 

  def show 
    @articles = @user.articles.paginate(page: params[:page], per_page: 5) 
  end 

  def new 
    @user = User.new # 빈 user 객체 
  end 

  def create # signup get요청을 처리해주는 곳 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username} you have successfully signed up "
      redirect_to articles_path
    else 
      render 'new'  # 다시 회원가입 창으로
    end 
  end

  def edit 
  end 

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else 
      render 'edit'
    end 
  end 

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end 

  def set_user 
    @user = User.find(params[:id])
  end 
end 