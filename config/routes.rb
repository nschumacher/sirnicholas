Rails.application.routes.draw do
  resources :topics
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
  resources :tags, only: [:index, :show]
end
