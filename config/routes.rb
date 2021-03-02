Rails.application.routes.draw do
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
	root to: "calendar#calendrier", :lieu => "tous les lieux"
	get 'log_in' => 'user_sessions#new', :as => :log_in
	post 'log_out' => 'user_sessions#destroy', :as => :log_out

	resources :reset_passwords, only: [:new, :create, :update, :edit]
	resource :calendar, only: [:calendrier, :aide], controller: :calendar
	resource :iframe, only: [:calendrier_iframe], controller: :iframe
	resources :seances
	resources :villages
	resources :films
	resources :classifications
	resources :users
	resources :user_sessions, only: [:new, :create, :destroy]
	resources :disponibilites
	get 'calendrier_iframe' => 'iframe#calendrier_iframe'
	get 'aide' => 'calendar#aide'
	get 'calendrier' => 'calendar#calendrier'
	get 'a_completer' => 'seances#a_completer'
	get 'mes_seances' => 'seances#mes_seances'
	get 'toutes_mes_seances' => 'seances#toutes_mes_seances'
	get 'seances_passees' => 'seances#seances_passees'
	get 'edition_calendrier' => 'seances#edition_calendrier'
	get 'entrees' => 'seances#entrees'
	get 'ecranvillage' => 'films#ecranvillage'
	get 'films_a_venir' => 'films#films_a_venir'
	get 'tous_les_films' => 'films#tous_les_films'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
