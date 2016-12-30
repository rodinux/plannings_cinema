class AddCommentaireToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :commentaire, :string
  end
end
