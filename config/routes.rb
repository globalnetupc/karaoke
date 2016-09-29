Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get 'application_karaoke/index', :to => redirect('karaoke_app/readme.html')

  get 'html/index'

  #get '/index', :to => redirect('/html/index')
  
  resources :boxes
  resources :cities
  resources :countries
  resources :employees
  resources :events
  resources :generes
  resources :group_emps
  resources :html
  resources :locations
  resources :payment_data
  resources :payment_details
  resources :payment_types
  resources :product_types
  resources :products
  resources :reserve_songs
  resources :shipment_details
  resources :shipment_statuses
  resources :shipment_types
  resources :shipments
  resources :songs
  resources :status_catalogs
  resources :stocks
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
  root 'html#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
