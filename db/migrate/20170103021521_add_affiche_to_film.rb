class AddAfficheToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :affiche, :string
  end
end
