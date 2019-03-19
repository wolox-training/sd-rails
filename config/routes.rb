Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :open_library_requests do
        collection do
          get :search 
        end
      end
      resources :rents, only: [:index, :create]
      resources :book_suggestions, only: [:create]
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
