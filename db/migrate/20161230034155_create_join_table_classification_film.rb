class CreateJoinTableClassificationFilm < ActiveRecord::Migration[5.0]
  def change
    create_join_table :classifications, :films do |t|
      # t.index [:classification_id, :film_id]
      # t.index [:film_id, :classification_id]
    end
  end
end
