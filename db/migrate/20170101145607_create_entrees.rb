class CreateEntrees < ActiveRecord::Migration[5.0]
  def change
    create_table :entrees do |t|
      t.string :billet
      t.integer :nombre

      t.timestamps
    end
  end
end
