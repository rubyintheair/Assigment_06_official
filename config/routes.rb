Rails.application.routes.draw do
  get 'comments/new'

  resources :posts do 
    get :paging, on: :collection
  end 

  get 'friends/my'
  get 'friends/friended_by'
  get "profile_01" => "users#edit"

  resources "messages" do
    collection do
      get :inbox
      get :sent
    end
  end

  get "friends" => "friends#index"

  # NOTE: /auth/facebook is supported by the omniauth-facebook gem

  get 'auth/:provider/callback' => 'sessions#callback'

  delete "remove_friend" => "friendships#destroy"
  resources :friendships
  delete '/posts' => 'posts#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :users do 
    member do 
      get 'profile'
    end
    collection do 
      get :search
      get :scroll
      get :paging
    end 
  end

  post "toggle_like" => "likes#toggle"
  resources :comments
  delete "/comments" => "comments#destroy"

  get "test" => "posts#test"
  root 'home#index'

  get "practice" => "posts#practice"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
