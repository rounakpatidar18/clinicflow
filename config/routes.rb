Rails.application.routes.draw do
  get "dashboard/index"
  root "appointments#index"
  resources :patients
  resources :appointments do
    resources :payments, except: [:index, :show]
    resources :reminders, except: [:index, :show]
  end
end
