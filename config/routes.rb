Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :topics
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :blogs
  resources :tags, only: [:index, :show]
  root to: 'pages#home'
end
