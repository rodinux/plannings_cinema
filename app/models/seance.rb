class Seance < ApplicationRecord

	belongs_to :film, :inverse_of => :seances
	belongs_to :village, :inverse_of => :seances
    validates :film_id, :presence => true
    validates :village_id, :presence => true
    validates :horaire, :presence => true

    before_create :setup_default_value_for_new_seances
    before_update :setup_default_value_for_updated_seances

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

    def entrees_for_form
    collection = @entrees.where(seance_id: id)
    collection.any? ? collection : @entrees.build
    end

    def self.seances_passees_3_semaines
         seances_passees_3_semaines = Seance.where({horaire: (3.week.ago..(Date.today + 1))}).order(horaire: :asc)
	end

	def self.seances_passees_1_mois
         seances_passees_1_mois = Seance.where({horaire: (4.weeks.ago..Date.today)}).order(horaire: :desc)
	end

	def self.seances_mois_1_mois
         seances_mois = Seance.where({horaire: (30.days.ago..Date.today)}).order(horaire: :desc)
    end

    def self.seances_semaine
         seances_semaine = Seance.where({horaire: (Date.today.midnight..(Date.today + 7))}).order(horaire: :desc)
    end

    def self.seances_1_mois_avant_apres
        seances_1_mois_avant_apres = Seance.where({horaire: (1.month.ago..(Date.today + 30))}).order(horaire: :asc)
    end

    def date
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

    def self.seances_calendrier
    	seances_calendrier = Seance.order(horaire: :asc)
    end

    def self.seances_a_completer_projection
    	seances_a_completer_projection = Seance.where(projection: "").order(horaire: :asc)
    end

    def self.seances_a_completer_caisse
    	seances_a_completer_caisse = Seance.where(caisse: "").order(horaire: :asc)
    end

    def self.seances_date_range
       seances_date_range = Seance.where({horaire: (range.to_i.days.ago..Date.today)})
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
    end

    def setup_default_value_for_updated_seances
       self.total_billets = self.billets_adultes + self.billets_enfants + self.billets_scolaires
    end
end
