# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
merchant_file = './data/merchants.csv'
merchant = File.read(merchant_file)
merchant_cells = CSV.parse(merchant, headers: true)
merchant_cells.each do |row|
  Merchant.create!(
      name:       name,
      created_at: created_at,
      updated_at: updated_at
                  )
  end
