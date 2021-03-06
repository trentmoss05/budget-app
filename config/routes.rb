Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'users#home'
  get '/expenselist' => 'users#expenselist'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post 'expenses/create', to: "expenses#create"
  post 'guests/create', to: 'guests#create'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :events do
    resources :expenses, only: [:new, :edit, :destroy, :create, :update]
    resources :guests, only: [:new, :destroy, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
