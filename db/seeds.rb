require 'csv'
# merchant_file = './data/merchants.csv'
# merchant = File.read(merchant_file)
# merchant_cells = CSV.parse(merchant, headers: true)
# merchant_cells.each do |row|
#   Merchant.create!(
#       id:         row[:id],
#       name:       row[:name],
#       created_at: row[:created_at],
#       updated_at: row[:updated_at]
#                   )
#   end
Merchant.destroy_all
  CSV.foreach("./data/merchants.csv", :headers => true) do |row|
  Merchant.create!(row.to_hash)
  end

Item.destroy_all
  CSV.foreach("./data/items.csv", :headers => true) do |row|
  Item.create!(row.to_hash)
  end
