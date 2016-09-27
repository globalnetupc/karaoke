Rails.application.routes.draw do
  get 'application_karaoke/index', :to => redirect('karaoke_app/readme.html')

  get 'html/index'

  #get '/index', :to => redirect('/html/index')
  resources :employees
  resources :group_emps
  resources :countries
  resources :cities
  resources :html
  resources :songs
  resources :events
  resources :locations
  resources :generes
  resources :stocks
  root 'html#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
