class Film < ApplicationRecord
	    has_many :seances, :dependent => :destroy, :inverse_of => :film
		accepts_nested_attributes_for :seances, :allow_destroy => true
		has_many :villages, :through => :seances
		has_and_belongs_to_many :classifications
		validates :id, :uniqueness => true, :case_sensitive => false
	    validates :titrefilm,:uniqueness => true, :case_sensitive => false

	    def self.films_3_semaines
	        films_3_semaines = Film.where({ updated_at: (3.week.ago.midnight..(Date.today + 1))}).order(created_at: :asc)
	    end

	    def self.films_2_mois_avant
	        films_2_mois_avant = Film.where({ updated_at: (2.month.ago.midnight..(Date.today + 1))}).order(created_at: :desc)
	    end

	    def self.films_mois
	    	films_mois = Film.where({updated_at: 1.month.ago.midnight..(Date.today + 1)}).order(created_at: :asc)
	    end

	    def self.films_entrees
	        films_entrees = film.seances.where(horaire: date_range)
	    end
end