Rails.application.routes.draw do
  

  root to: "calendar#calendrier", :lieu => "tous les lieux"
  resources :users
  resources :users
  resources :user_sessions

  resource :calendar, only: [:calendrier], controller: :calendar

  resources :seances
  resources :villages
  resources :films
  get 'calendrier' => 'calendar#calendrier'

  get 'log_in' => 'user_sessions#new', :as => :log_in
  post 'log_out' => 'user_sessions#destroy', :as => :log_out
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
