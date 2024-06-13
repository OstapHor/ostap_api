class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :realtor, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.integer :final_rating
      t.integer :security_rating
      t.integer :infrastructure_rating
      t.integer :location_to_city_center_rating
      t.integer :maintenance_rating
      t.integer :neighborhood_rating

      t.timestamps
    end
  end
end
