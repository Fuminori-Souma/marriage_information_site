Rails.application.routes.draw do
  # get 'posts/index' => 'posts/index'
  # # get 'home/top'
  # get '' => "home#top"
  # get 'about' => "home#about"
  # get 'posts/new' => 'posts#new'
  # get 'posts/:id' => 'posts#show'
  # get 'posts/:id/edit' => 'posts#edit'
  # post 'posts/:id/update' => 'posts#update'
  # post 'posts/create' => 'posts#create'
  # post 'posts/:id/destroy' => 'posts#destroy'


  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  # get "top" => "home#top"
  get "about" => "home#about"
  # get "/about" => "posts#index"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    collection do
      get 'search'
    end
  end

  resources :posts
end
