Rails.application.routes.draw do
  constraints(subdomain: 'admin') do
    resources :controls
    resources :device_types
    resources :devices
    root 'home#index'
  end
end
