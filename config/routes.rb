Nowt::Application.routes.draw do
  
  get 'users/profile'
  devise_scope :user do
  	get "/login" => "devise/sessions#new"
  	post "/login" => "devise/sessions#create"
  	get "/register" => "registrations#new"
  	post "/register" => "registrations#create"
  	delete "/logout" => "devise/sessions#destroy"
    get "/profile" => "users#profile"
  end


  devise_for :users, controllers: {registrations: 'registrations'}

  root 'home#index'

  resources :posts
  resources :users, only: [:show, :index]
  
  
end
