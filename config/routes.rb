Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get 'books', to: 'books#index'
      get 'books/:id', to: 'books#show'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
