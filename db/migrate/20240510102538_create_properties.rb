class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.string :location
      t.float :price

      t.timestamps
    end
  end
end
