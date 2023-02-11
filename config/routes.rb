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
    get '/movies/genres/:id' => 'movies#genre_movies', as: 'genre_movies'
  #moviesが親、reviewsが子の関係  
    resources :movies,only:[:new,:create,:index,:show] do
      resources :reviews,only:[:new,:create,:show] do
        resources :comments,only:[:new,:create]
      end
    end
  
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
    get '/movies/genres/:id' => 'homes#genre_movies', as: 'genre_movies'
  #moviesが親、reviewsが子の関係  
    resources :movies,only:[:show] do
      resources :reviews,only:[:show,:destroy]
    end
    resources :members,only:[:index,:show]
    patch '/members/:id' => 'members#update', as: 'member_update'
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
