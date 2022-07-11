class ChangeDefaultCondominium < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :condominium, :float, default: 0.0
  end
end
