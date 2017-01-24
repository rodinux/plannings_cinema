class AddBilletsToSeance < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :billets_adultes, :integer
    add_column :seances, :billets_enfants, :integer
    add_column :seances, :billets_scolaires, :integer
    add_column :seances, :total_billets, :integer
  end
end
