class SeanceSearch
	attr_reader :date_from, :date_to

	def initialize(params)
		params ||= {}
		@date_from = parsed_date(params[:date_from], 7.days.ago.to_date.strftime("%d/%m/%Y"))
		@date_to = parsed_date(params[:date_to], Date.today.strftime("%d/%m/%Y"))
	end

	def scope
	   Seance.where('horaire BETWEEN ? and ?', @date_from.to_date, @date_to.to_date)
	end

private

	def parsed_date(date_string, default)
       Date.parse(date_string)
    rescue ArgumentError, TypeError
    	default
	end
end