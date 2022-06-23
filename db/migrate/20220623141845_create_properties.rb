class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :description
      t.string :address
      t.integer :bathrooms
      t.float :area
      t.integer :rooms
      t.integer :suites
      t.integer :parking_space
      t.boolean :furnished
      t.float :condominium
      t.float :iptu
      t.float :price
      t.float :building
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
