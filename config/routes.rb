Rails.application.routes.draw do
  
  #会員側
  #URL/members/sign_in...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  #ルーティング設定
  scope module: :public do
    root 'homes#top'
    get '/members/my_page' => 'members#show'
    resources :movies,only:[:new,:create,:index,:show]
    resources :reviews,only:[:new,:create,:show]
    resources :comments,only:[:new,:create]
  
  #ゲストログイン
  devise_scope :member do
    post 'guest_sign_in' => 'sessions#new_guest'
  end
  
  end
  
  #管理者側
  #URL/admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #ルーティング設定
  namespace :admin do
    root 'homes#top'
    resources :movies,only:[:show]
    resources :reviews,only:[:show,:destroy]
    resources :members,only:[:index,:show]
    #resources :genres
    
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
