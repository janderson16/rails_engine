require 'csv'

namespace :install do

  # Checks and ensures task is not run in production.
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nCurrently in production environment.\n Can't drop production database."
    end
  end

  desc "Run all rake tasks for install in test environment"
  task :all => [:ensure_development_environment,
                    "db:drop",
                    "db:create",
                    "db:migrate",
                    "db:test:prepare",
                    "db:seed"]
  # desc "Import data from CSV"
  # task data: :environment do

    # Merchant.destroy_all
    #   CSV.foreach("./data/merchants.csv", :headers => true) do |row|
    #   Merchant.create!(row.to_hash)
    # end
    #
    # Customer.destroy_all
    #   CSV.foreach("./data/customers.csv", :headers => true) do |row|
    #   Customer.create!(row.to_hash)
    # end
    #
    # Invoice.destroy_all
    #   CSV.foreach("./data/invoices.csv", :headers => true) do |row|
    #   Invoice.create!(row.to_hash)
    # end
    #
    # Transaction.destroy_all
    #   CSV.foreach("./data/transactions.csv", :headers => true) do |row|
    #   Transaction.create!(row.to_hash)
    # end
    #
    # Item.destroy_all
    #   CSV.foreach("./data/items.csv", :headers => true) do |row|
    #   Item.create!(row.to_hash)
    # end
    #
    # InvoiceItem.destroy_all
    # CSV.foreach("./data/invoice_items.csv", :headers => true) do |row|
    #   InvoiceItem.create!(row.to_hash)
    # end
  # end
end
