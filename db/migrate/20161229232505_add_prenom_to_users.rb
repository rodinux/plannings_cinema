class AddPrenomToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prenom, :string
  end
end
