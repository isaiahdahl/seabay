Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :fishorders, only: [:destroy]
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :fishorders, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
