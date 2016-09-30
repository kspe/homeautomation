Rails.application.routes.draw do
  constraints(subdomain: 'admin') do
    resources :controls
    resources :device_types
    resources :devices
    root 'devices#index', as: 'admin_root'
  end

  constraints(subdomain: 'app') do
    root 'frontend#index', as: 'frontend_root'
  end
end
