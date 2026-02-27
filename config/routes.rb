Rails.application.routes.draw do
  get  "/login",  to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "dashboard/index"
  root "appointments#index"
  resources :patients
  resources :appointments do
    resources :payments, except: [ :index, :show ]
    resources :reminders, except: [ :index, :show ]
  end
end
