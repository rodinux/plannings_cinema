class Calendar < Struct.new(:view, :date, :callback)

	def table(lieu)
		content_tag :table, class: "calendar table table-bordered table-striped table-responsive table-croped" do
			header + week_rows
		end
	end

	HEADER = %w[Mercredi Jeudi Vendredi Samedi Dimanche Lundi Mardi]
	START_DAY = :wednesday

	def header
		content_tag :thead do
			HEADER.map { |day| content_tag :th, day }.join.html_safe
		end
	end

	def weeks
		first = date.beginning_of_week(START_DAY)
		last = date.end_of_week(START_DAY)
		(first..last).to_a.in_groups_of(7)
	end

	delegate :content_tag, to: :view

	def week_rows
	  weeks.map do |week|
	  	  content_tag :tr do
	      week.map { |day| day_cell(day) }.join.html_safe
	    end
	  end.join.html_safe
	end

	def day_cell(day)
   	  	content_tag :td, view.capture(day, &callback), class: day_classes(day)
	end

	def day_classes(day)
		classes = []
		classes << "today" if day == Date.today
		classes << "nodate" if day.month != date.month
		classes.empty? ? nil : classes.join(" ")
	end
end