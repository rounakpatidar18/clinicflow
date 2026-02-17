Rails.application.routes.draw do
  get "home/index"
  root "appointments#index"
  resources :appointments
  resources :patients
end
