require 'csv'

Merchant.destroy_all
CSV.foreach("./data/merchants.csv", :headers => true) do |row|
  Merchant.create!(row.to_hash)
end

Customer.destroy_all
CSV.foreach("./data/customers.csv", :headers => true) do |row|
  Customer.create!(row.to_hash)
end
