class AddSeanceIdToEntree < ActiveRecord::Migration[5.0]
  def change
    add_column :entrees, :seance_id, :integer
  end
end
