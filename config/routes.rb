Nowt::Application.routes.draw do
  root 'home#index'



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

  resources :posts 
  get '/posts/new', to: "posts#new"

  get '/board', to: "posts#index", as: "board"

  resources :users, only: [:show, :index]
end
