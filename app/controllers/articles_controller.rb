class ArticlesController < ApplicationController
  def show 
    byebug  # 웹서버를 잠시 일시중지시키고 디버그 하는 라이브러리 파일 실행 
    @article = Article.find(params[:id])
  end 
end 