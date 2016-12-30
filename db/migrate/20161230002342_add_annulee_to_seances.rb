class AddAnnuleeToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :annulee, :string
  end
end
