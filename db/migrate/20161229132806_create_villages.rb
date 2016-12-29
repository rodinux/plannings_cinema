class CreateVillages < ActiveRecord::Migration[5.0]
  def change
    create_table :villages do |t|
      t.string :commune
      t.string :salle

      t.timestamps
    end
  end
end
