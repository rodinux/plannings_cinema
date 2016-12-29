class CreateJoinTableVillageSeance < ActiveRecord::Migration[5.0]
  def change
    create_join_table :villages, :seances do |t|
      # t.index [:village_id, :seance_id]
      # t.index [:seance_id, :village_id]
    end
  end
end
