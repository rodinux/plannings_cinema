class Village < ApplicationRecord
		has_many :seances, :dependent => :destroy, :inverse_of => :village
		has_many :films, :through => :seances
		validates :id, :uniqueness => true
	    validates :commune, :presence => true
end
