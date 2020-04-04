Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :topics
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
  resources :tags, only: [:index, :show]
end
