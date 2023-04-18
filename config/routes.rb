Rails.application.routes.draw do
  resources :notes, only: [:create, :destroy, :update]
  resources :treatments, only: [:create, :destroy, :update]
  resources :prescriptions, only: [:create, :destroy, :update]
  resources :appointments
  get 'calendar_columns', to: 'appointments#calendar_columns'
  resources :patient_contacts
  resources :diagnoses
  resources :patient_pharmacies, only: [:create, :destroy, :update]
  resources :pharmacies
  resources :patients
  get 'patients_search', to: 'patients#search'
  resources :manage_users, except: [:show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'calendar', to: 'pages#calendar'
  get 'schedule', to: 'pages#schedule'

  # Defines the root path route ("/")
  root "pages#dashboard"
end
