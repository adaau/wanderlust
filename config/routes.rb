Rails.application.routes.draw do
  namespace :api do
    resources :places, only: [:index, :show]
    resources :bookmarks, except: [:edit, :update]
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  root 'static_pages#index'
end
