class CreateSuckerCorps < ActiveRecord::Migration
  def change
    create_table :sucker_corps do |t|
      t.integer :sucker_id
      t.integer :corpoation_id
      
      t.timestamps null: false
    end
  end
end