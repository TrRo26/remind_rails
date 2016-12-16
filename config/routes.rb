Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :lists, only: [:show]

end
