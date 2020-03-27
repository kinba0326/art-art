Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'arts#index'
  resources :arts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :selects, only: :index 
  get 'artists', to: 'artists#index'
  get 'rankings', to: 'rankings#index'
  get 'events', to: 'events#index'
end
