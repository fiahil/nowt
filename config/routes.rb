Nowt::Application.routes.draw do
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
    get "/edit" => "registrations#edit"
  end


  devise_for :users, controllers: {registrations: 'registrations', :omniauth_callbacks => 'omniauth_callbacks'}

   


  get '/board', to: "posts#index", as: "board"
  resources :posts

  resources :users, only: [:show, :index]

  get '/search', to: "tasks#live_search"
end
