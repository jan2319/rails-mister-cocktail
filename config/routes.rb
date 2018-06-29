Rails.application.routes.draw do
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :new, :create, :show ] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  root to: 'pages#home'

  resources :doses, only: [:destroy]
end
