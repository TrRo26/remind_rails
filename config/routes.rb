Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :lists, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :lists
    end
  end
end
