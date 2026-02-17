Rails.application.routes.draw do
  get "home/index"
  root "appointments#index"
  resources :patients
  resources :appointments do
    resources :payments, except: [:index, :show]
  end
end
