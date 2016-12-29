class Seance < ApplicationRecord
		belongs_to :film, :inverse_of => :seances
		belongs_to :village, :inverse_of => :seances
	    validates :film_id, :presence => true
	    validates :village_id, :presence => true
	    validates :horaire, :presence => true

	    def self.lieuxtest
	      lieuxtest = Hash[
	        "lamastre" => Seance.order(horaire: :asc).map{ |seance|
	         seance if seance.village.commune.upcase == "LAMASTRE" },
	        "vernoux"  => Seance.all.order(horaire: :asc).map{ |seance| seance if seance.village.commune.upcase == "VERNOUX" },
	        "chalencon" => Seance.all.order(horaire: :asc).map{ |seance| seance if seance.village.commune.upcase == "CHALENCON" },
	        "itinerance" => Seance.all.order(horaire: :asc).map{ |seance| seance if seance.village.commune.upcase != "LAMASTRE" &&
	                seance.village.commune.upcase != "VERNOUX" && seance.village.commune.upcase != "CHALENCON" },
	          "tous les lieux" => Seance.all.order(horaire: :asc).map{|seance| seance }
	        ]
	    end
end
