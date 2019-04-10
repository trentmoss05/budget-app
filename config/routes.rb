Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post "expenses/create", to: "expenses#create"
  resources :events do
    resources :expenses, only: [:new, :edit, :destroy, :create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
