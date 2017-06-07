class Village < ApplicationRecord
		has_many :seances, :dependent => :destroy, :inverse_of => :village
		accepts_nested_attributes_for :seances, :allow_destroy => true
		has_many :films, :through => :seances
		validates :id, :uniqueness => true, :case_sensitive => false
	    validates :commune, :presence => true, :case_sensitive => false
end
