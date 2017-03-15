class RemoveCcNumberFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :cc_number, :integer
    remove_column :transactions, :cc_expiration, :date
  end
end
