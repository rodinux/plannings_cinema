Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  root to: "calendar#calendrier", :lieu => "tous les lieux"

  resource :calendar, only: [:calendrier], controller: :calendar

  resources :seances
  resources :villages
  resources :films
  resources :classifications
  resources :users
  resources :user_sessions
  get 'aide' => 'calendar#aide'
  get 'calendrier' => 'calendar#calendrier'
  get 'a_completer' => 'seances#a_completer'
  get 'mes_seances' => 'seances#mes_seances'
  get 'seances_passees' => 'seances#seances_passees'
  get 'edition_calendrier' => 'seances#edition_calendrier'
  get 'entrees' => 'seances#entrees'
  get 'ecranvillage' => 'films#ecranvillage'
  get 'films_edition' => 'films#films_edition'
  get 'log_in' => 'user_sessions#new', :as => :log_in
  post 'log_out' => 'user_sessions#destroy', :as => :log_out
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
