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
  get 'a_completer' => 'seances#a_completer'
  get 'mes_seances' => 'seances#mes_seances'
  get 'seances_passees' => 'seances#seances_passees'
  get 'log_in' => 'user_sessions#new', :as => :log_in
  post 'log_out' => 'user_sessions#destroy', :as => :log_out
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
