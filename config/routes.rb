Rails.application.routes.draw do
  resources :controls
  resources :device_types
  resources :devices
  root 'home#index'
end
