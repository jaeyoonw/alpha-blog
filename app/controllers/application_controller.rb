class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # 이렇게 하면 view에서도 이 메소드를 사용할 수 있게 된다. 

  def current_user # 현재의 사용하고있는 유저를 확인
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # return 생략 되어있는거 같다. 
  end 

  def logged_in? # 사용자가 로그인되어있는지 확인 
    !!current_user # 현재 사용하고 있는 유저가 존재한다면? true를 반환
  end 

  def require_user 
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action !"
      redirect_to login_path
    end
  end 
end
