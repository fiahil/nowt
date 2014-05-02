Nowt::Application.routes.draw do
  
  resources :activities
  resources :tags

  root 'home#index'

  get '/tasks', to: "tasks#index", as: "tasks"

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    post "/login" => "devise/sessions#create"
    get "/register" => "registrations#new"
    post "/register" => "registrations#create"
    delete "/logout" => "devise/sessions#destroy"
    get "/profile" => "users#profile"
    get "/account" => "users#edit"
    get "/edit_password" => "users#edit_password"
    get "/edit_name" => "users#edit_name"
    get "/edit_email" => "users#edit_email"
    get "/edit_avatar" => "users#edit_avatar"
    patch '/update' => 'users#update'
    match '/delete' => 'users#destroy', :via => :delete
    patch '/update_tag' => "users#update_tags"

  end

  devise_for :users, controllers: {registrations: 'registrations', :omniauth_callbacks => 'omniauth_callbacks'}

  get '/board', to: "posts#index", as: "board"
  resources :posts

  get '/search', to: "posts#search", as: "search"

  resources :users, only: [:show, :index]

  get '/livesearch', to: "tasks#live_search"
  get '/emptySearch', to: "tasks#empty_search"

  mount Commontator::Engine => '/commontator'
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
