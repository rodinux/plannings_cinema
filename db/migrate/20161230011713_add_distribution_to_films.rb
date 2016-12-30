class AddDistributionToFilms < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :distribution, :string
  end
end
