class Entree < ApplicationRecord
  belongs_to :seance, :inverse_of => :entrees
  validates_presence_of :billet

 before_create :setup_default_value_for_new_entrees

 private

 	def setup_default_value_for_new_entrees
	    if self.nombre.blank?
	        self.nombre = 0
	    end
    end
end
