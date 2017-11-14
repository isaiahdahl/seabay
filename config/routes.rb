Rails.application.routes.draw do
  root to: 'pages#home'

  get "my_restaurants", to: "restaurants#my_restaurants"
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :fishorders, only: [:destroy]

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :fishorders, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end