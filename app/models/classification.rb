class Classification < ApplicationRecord
	has_and_belongs_to_many :films
	has_many :seances, :through => :films
end
