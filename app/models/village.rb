class Village < ApplicationRecord
  has_many :seances, :dependent => :destroy, :inverse_of => :village
  accepts_nested_attributes_for :seances, :allow_destroy => true
  has_many :films, :through => :seances
  validates :id, :uniqueness => true, :case_sensitive => false
  validates :commune, :presence => true, :case_sensitive => false
  validates :salle, :presence => true, :case_sensitive => false
  validates :import_id, :uniqueness => true, :case_sensitive => false

  before_create :setup_default_value_for_new_villages
  #throw(:abort)

  private

  def setup_default_value_for_new_villages
      village_import_last = Village.order(:import_id).last
      if self.import_id.blank?
        self.import_id = village_import_last.import_id + 1
      end
  end

end




