Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   devise_for :accounts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#Rails.Application.routes.draw do |map|
  resources :friendships
  #resources :sessions
  resources :accounts do
    resources :posts
  end


  resources :posts do
    resources :comments
  end	

  
  resources :posts do
    resources :likes
  end

  root to: "public#homepage"
  end