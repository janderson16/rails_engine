class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.integer :cc_number
      t.date :cc_expiration
      t.integer :result

      t.timestamps
    end
  end
end
