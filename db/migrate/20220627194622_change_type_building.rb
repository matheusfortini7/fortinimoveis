class ChangeTypeBuilding < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :building, :string
  end
end
