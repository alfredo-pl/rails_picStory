Rails.application.routes.draw do
  
  resources :sessions, only:[:new, :create, :destroy]

  resources :stories
  resources :users, only:[:new, :create, :show]
  get 'dashboard/:id', to: 'users#dashboard', as: 'dashboard'
  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
