Rails.application.routes.draw do
  root to: "articles#index"
  get '/', to: 'articles#index'
  get 'pages/about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
