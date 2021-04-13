Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home' # default root URL 
  get 'about', to: 'pages#about'
  resources :articles, only: [:show]   # articles는 테이블명, articles/show 라우트만 남기고 다룬 라우트는 제거하라는 의미 
end