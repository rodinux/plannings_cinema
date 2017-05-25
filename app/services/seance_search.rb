class SeanceSearch
	attr_reader :date_from, :date_to

	def initialize(params)
		params ||= {}
		@date_from = parsed_date(params[:date_from], 7.days.ago)
		@date_to = parsed_date(params[:date_to], Date.today)
	end

	def scope
	   Seance.where('horaire BETWEEN ? and ?', @date_from, @date_to)
	end

private

	def parsed_date(date_string, default)
       Date.parse(date_string)
    rescue ArgumentError, TypeError
    	default
	end
end