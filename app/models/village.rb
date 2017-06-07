class Village < ApplicationRecord
		has_many :seances, :dependent => :destroy, :inverse_of => :village
		validates :id, :uniqueness => true
	    validates :commune, :presence => true
end
