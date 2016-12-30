class AddVillageIdToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :village_id, :integer
  end
end
