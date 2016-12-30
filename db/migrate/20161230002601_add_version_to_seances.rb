class AddVersionToSeances < ActiveRecord::Migration[5.0]
  def change
    add_column :seances, :version, :string
  end
end
