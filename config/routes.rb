Rails.application.routes.draw do
  resources :notes
  resources :treatments
  resources :prescriptions
  resources :appointments
  resources :patient_contacts
  resources :diagnoses
  resources :patient_pharmacies, only: [:create, :destroy, :update]
  resources :pharmacies
  resources :patients
  resources :manage_users, except: [:show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'calendar', to: 'pages#calendar'
  get 'schedule', to: 'pages#schedule'

  # Defines the root path route ("/")
  root "pages#dashboard"
end
