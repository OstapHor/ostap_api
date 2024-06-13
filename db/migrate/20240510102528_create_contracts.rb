class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.references :realtor, null: false, foreign_key: true
      t.string :details

      t.timestamps
    end
  end
end
