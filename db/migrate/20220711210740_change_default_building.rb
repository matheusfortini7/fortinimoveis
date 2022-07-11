class ChangeDefaultBuilding < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :building, :string, default: 'Casa'
  end
end
