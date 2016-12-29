class CreateSeances < ActiveRecord::Migration[5.0]
  def change
    create_table :seances do |t|
      t.string :projection
      t.string :caisse
      t.datetime :horaire

      t.timestamps
    end
  end
end
