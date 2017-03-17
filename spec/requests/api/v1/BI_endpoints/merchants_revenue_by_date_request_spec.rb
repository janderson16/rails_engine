require 'rails_helper'

describe ".revenue" do
  it "returns revenue across all transactions for a specific merchant" do
    date = "2012-03-25 11:15:28"
    merch_1 = Merchant.create!(name: "Merchant 1")
    customer = Customer.create!(first_name: "Joe", last_name: "Schmo")
    item_1 = Item.create!(name: "thing", unit_price: 700, merchant_id: merch_1.id)
    item_2 = Item.create!(name: "thing2", unit_price: 200, merchant_id: merch_1.id)
    invoice_1 = Invoice.create!(merchant_id: merch_1.id, customer_id: customer.id, created_at: date)
    invoice_2 = Invoice.create!(merchant_id: merch_1.id, customer_id: customer.id, created_at: date)
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 2, item_id: item_1.id, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_2.id, quantity: 1, item_id: item_2.id, unit_price: item_2.unit_price)
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, result: "success")
    # total_revenue = merch_1.total_revenue(date)

    get "/api/v1/merchants/#{merch_1.id}/revenue?date=#{date}"

    expect(response).to be_success
    output = JSON.parse(response.body)

  end
end
