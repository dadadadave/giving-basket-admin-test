Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :checks, only: [:index]
  resources :nonprofits, only: [:update]
  resources :payments, only: [:create]
end
