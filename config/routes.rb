Rails.application.routes.draw do
  get 'calendrier' => 'calendar#calendrier'

  resource :calendar, only: [:calendrier], controller: :calendar
  root to: "calendar#calendrier", :lieu => "tous les lieux"

  resources :seances
  resources :villages
  resources :films
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
