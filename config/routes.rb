Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/posts/new', to: 'posts#new', as: 'create_post'
  # post '/posts/new', to: 'posts#create'
  # get '/users/:user_id/posts/:id', to: 'posts#show', as:'post'
  # post '/users/:user_id/posts/:id', to: 'posts#create_comment'
  # post '/users/:user_id/posts/:id/likes', to: 'posts#create_like', as: 'like'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
end