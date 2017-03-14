require 'csv'

Merchant.destroy_all
CSV.foreach("./data/merchants.csv", :headers => true) do |row|
  Merchant.create!(row.to_hash)
end

Customer.destroy_all
CSV.foreach("./data/customers.csv", :headers => true) do |row|
  Customer.create!(row.to_hash)
end

Invoice.destroy_all
CSV.foreach("./data/invoices.csv", :headers => true) do |row|
  Invoice.create!(row.to_hash)
end

Transaction.destroy_all
CSV.foreach("./data/transactions.csv", :headers => true) do |row|
  Transaction.create!(row.to_hash)
end
