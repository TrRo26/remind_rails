Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :lists, only: [:index, :show, :create, :update, :destroy]
  resources :items, only: [:index, :show, :create, :update, :destroy]


  resources :maps, only: [:create]



  # namespace :api do
  #   namespace :v1 do
  #     resources :lists
  #   end
  # end
end
