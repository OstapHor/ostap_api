class CreateRealtors < ActiveRecord::Migration[7.1]
  def change
    create_table :realtors do |t|
      t.string :username
      t.string :email
      t.float :rating
      t.string :contactinfo

      t.timestamps
    end
  end
end
