class EntreeFacade

	def initialize(seances)
		@seances = seances
		@req = @seances.where(annulee: [nil, ""]).joins(:film).group(:film_id).count
	end

	def films_per_daterange
		@req.length
	end

	def seances_per_film
		Film.joins(:seances).merge(@seances.where(annulee: [nil, ""]))
	end

	def seances_film_per_lieu(lieu_id)
		@seances.where(village_id: lieu_id, annulee: [nil, ""])
	end

	def seances_per_film_classification(tri_classification)
	    @seances.where(film_id: seances_per_film.joins(:classifications).merge(Classification.where(nom_classification: tri_classification)).group(:id), annulee: [nil, ""])
    end

    def films_seances_classees
       seances_per_film.joins(:classifications).merge(Classification.all).group(:id)
    end

    def seances_per_film_classification_all
    	@seances.where(film_id: films_seances_classees, annulee: [nil, ""])
    end

    def films_adrc_classee
    	films_seances_classees.where(distribution: "ADRC").compact
    end

    def seances_adrc_classee
        @seances.where(film_id: films_adrc_classee, annulee: [nil, ""])
    end

    def films_adrc
    	seances_per_film.where(distribution: "ADRC").group(:id)
    end

    def seances_adrc
        @seances.where(film_id: films_adrc, annulee: [nil, ""])
    end

    def films_seances_classees_order_total
        films_seances_classees.joins(:seances).merge(@seances.where(annulee: [nil, ""]).order("sum(total_billets) DESC"))
    end

    def films_seances_adrc_order
    	films_adrc.joins(:seances).merge(@seances.where(annulee: [nil, ""]).order("sum(total_billets) DESC"))
    end

    def seances_range
        @seances.where(annulee: [nil, ""])
    end

    def seances_range_annulee
       @seances.where(annulee: "Annulée")
    end

    def films_order_total
    	seances_per_film.joins(:seances).group(:id).merge(@seances.where(annulee: [nil, ""]).order("sum(total_billets) DESC"))
    end

     def seances_film
     	@seances.films_order_total.each do |film|
     	film.seances.where(annulee: [nil, ""])
     end
 end

     def film_seances_semaine_per_lieu(lieu_id)
     	 film_seances_semaine.where(village_id: lieu_id)
     end


end
