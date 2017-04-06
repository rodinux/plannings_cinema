class CreateDisponibilites < ActiveRecord::Migration[5.0]
  def change
    create_table :disponibilites do |t|
      t.string :nom
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
