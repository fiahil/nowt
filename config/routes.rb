Nowt::Application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  root 'home#index'

  resources :posts
  resources :users, only: [:show, :index]
end
