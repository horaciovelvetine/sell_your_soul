class CreateSuckerCorpsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sucker_corps do |t|
      t.integer :sucker_id
      t.integer :corporation_id
      
      t.timestamps null: false
    end
  end
end
