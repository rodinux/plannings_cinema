class Film < ApplicationRecord
	has_many :seances, :dependent => :destroy, :inverse_of => :film
	accepts_nested_attributes_for :seances, :allow_destroy => true
	has_many :villages, :through => :seances
end
