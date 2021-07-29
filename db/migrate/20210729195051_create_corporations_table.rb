class CreateCorporationsTable < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :name
      t.float :payout_amount
      t.timestamps null: false
    end
  end
end
