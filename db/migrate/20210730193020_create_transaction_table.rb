class CreateTransactionTable < ActiveRecord::Migration[6.1]
  def change
    create_table "transactions" do |t|
      t.float "amount"
      t.string "transaction_id"
    end

    
  end
end
