Rails.application.routes.draw do
  constraints(subdomain: 'admin') do
    scope module: 'admin' do
      resources :controls
      resources :device_types, except: :show
      resources :devices, except: :show
      root 'devices#index', as: 'admin_root'
    end
  end

  constraints(subdomain: 'app') do
    scope module: 'frontend' do
      root 'devices#index', as: 'frontend_root'
      resources :devices, as: 'app_devices', only: [:index, :update]
    end
  end
end
