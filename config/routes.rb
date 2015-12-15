Rails.application.routes.draw do
  get '/api/places/random', to: 'api/places#random'

  namespace :api do
    resources :places, only: [:index, :show]
    resources :bookmarks, except: [:edit, :update]
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'
end
