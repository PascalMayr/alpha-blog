Rails.application.routes.draw do
  root to: "articles#index"
  get '/', to: 'articles#index'
  get 'pages/about', to: 'pages#about'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
