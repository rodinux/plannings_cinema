class AddExtrasToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :extras, :string
  end
end
