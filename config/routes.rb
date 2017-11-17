Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }

  resources :fish_orders, only: [:destroy] do
    member do
      get "add"
      get "remove"
      post "email-order"
    end
  end

  resources :restaurants, only: [:index, :show, :new, :create] do

    resources :fish_orders, only: [:new, :create] do
    end

    member do
      get "my_restaurant", constraints: lambda { |req| User.find(req.session["warden.user.user.key"].first.first).restaurant.id == req.params[:id].to_i }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end