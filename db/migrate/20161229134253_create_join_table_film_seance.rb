class CreateJoinTableFilmSeance < ActiveRecord::Migration[5.0]
  def change
    create_join_table :films, :seances do |t|
      # t.index [:film_id, :seance_id]
      # t.index [:seance_id, :film_id]
    end
  end
end
