Rails.application.routes.draw do
    devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
    resources :topics
    get 'home', to: 'pages#home'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'

    resources :blogs do 
        member do
            get :toggle_status
        end
    end
    resources :tags, only: [:index, :show]

    mount ActionCable.server => '/cable'

    root to: 'pages#home'
end
