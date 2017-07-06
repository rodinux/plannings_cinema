class Disponibilite < ApplicationRecord
	before_create :setup_default_value_for_new_disponibilites

	private

	def setup_default_value_for_new_disponibilites
	    if self.start_time.blank?
	        self.start_time = Date.today
	    end
	    if self.end_time.blank?
	        self.end_time = Date.today
	    end
	end
end
