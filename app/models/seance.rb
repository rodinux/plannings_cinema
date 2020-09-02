class Seance < ApplicationRecord

	belongs_to :film, :inverse_of => :seances, optional: true
	belongs_to :village, :inverse_of => :seances, optional: true
	validates :film_id, :presence => true
	validates :village_id, :presence => true
	validates :horaire, :presence => true
	validates :import_id, :uniqueness => true, :case_sensitive => false

	before_create :setup_default_value_for_new_seances
	#throw(:abort)
	before_update :setup_default_value_for_updated_seances
	#throw(:abort)


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

	def self.seances_calendrier
		seances_calendrier = Seance.where({horaire: ((Date.today - 6.day)..(Date.today + 6.day))})
	end

	def self.seances_a_venir
        seances_a_venir = Seance.where({horaire: (Date.today.midnight..Date.today + 60)})
	end

	def self.seances_hier
		seances_hier = Seance.where({horaire: (2.day.ago..Date.today)})
	end

	def self.seances_passees_3_semaines
		seances_passees_3_semaines = Seance.where({horaire: (3.week.ago..(Date.today + 1))}).order(horaire: :asc)
	end

	def self.seances_passees_1_mois
         seances_passees_1_mois = Seance.where({horaire: (30.days.ago..Date.today)}).order(horaire: :desc)
	end

	def self.seances_semaine
         seances_semaine = Seance.where({horaire: (Date.today.midnight..(Date.today + 7))}).order(horaire: :desc)
	end

	def self.seances_1_mois_avant_apres
	    seances_1_mois_avant_apres = Seance.where({horaire: (1.month.ago..(Date.today + 60))}).order(horaire: :asc)
	end

	def self.seances_1_semaine_avant_2_mois_apres
	    seances_1_semaine_avant_1_mois_apres = Seance.where({horaire: (1.week.ago..(Date.today + 60))}).order(horaire: :asc)
	end

	def self.seances_asc
		seances_asc = Seance.order(horaire: :asc)
	end

	def	self.seances_desc
		seances_asc = Seance.order(horaire: :desc)
	end

	def self.seances_a_completer_projection
		seances_a_completer_projection = Seance.where(projection: [nil, ""]).order(horaire: :asc)
	end

	def self.seances_a_completer_caisse
		seances_a_completer_caisse = Seance.where(caisse: [nil, ""]).order(horaire: :asc)
	end

	def self.seances_date_range
	   	seances_date_range = Seance.where({horaire: (range.to_i.days.ago..Date.today)})
	end

	def self.seances_annulee
	   	seances_annulee = Seance.where({annulee: ["Annulée", nil]})
	end

	def self.to_csv
    attributes = %w{ Subject Start\ Date Start\ Time End\ Date End\ Time Location }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      Seance.seances_1_mois_avant_apres.each do |seance|
        csv << ["#{seance.film.titrefilm} #{seance.version}",seance.horaire.strftime('%d/%m/%Y'),seance.horaire.strftime('%I:%M %p'),seance.horaire.strftime('%d/%m/%Y'),(seance.horaire + 2.hours).strftime('%I:%M %p'),"#{seance.village.commune}, #{seance.village.salle}"]
      end
    end
  end

	private

	def setup_default_value_for_new_seances
	  	if self.billets_adultes.blank?
	      self.billets_adultes = 0
     	end
	  	if self.billets_enfants.blank?
	      self.billets_enfants = 0
	  	end
	  	if self.billets_scolaires.blank?
	      self.billets_scolaires = 0
	  	end
	  	if self.total_billets.blank?
	      self.total_billets = 0
	  	end
	  	seance_import_last = Seance.order(:import_id).last
	  	if self.import_id.blank?
	  		self.import_id = seance_import_last.import_id + 1
	  	end
	end

	def setup_default_value_for_updated_seances
	   	self.total_billets = self.billets_adultes + self.billets_enfants + self.billets_scolaires
	end
end
