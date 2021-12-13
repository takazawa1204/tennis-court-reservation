Rails.application.routes.draw do
  root to: 'homes#top'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get '/users/my_page', to: 'users#show'
  
  resources :users, only: [:create, :show, :edit, :update]
  
end
