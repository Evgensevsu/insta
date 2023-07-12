Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :posts do
    resources :comments, only: [:new,:create, :destroy]
  end

  devise_scope :user do
    
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/:id/follow', to: "users#follow", as: "follow"
    post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  end
  devise_for :users, controllers: {
    regestrations: 'users/regestrations'
  }
  resources :users, only: [:show]
  resources :posts
  get 'home/about'
  get 'posts/myposts'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"


end
