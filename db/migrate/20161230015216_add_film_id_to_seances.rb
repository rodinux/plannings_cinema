class AddFilmIdToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :film_id, :integer
  end
end
