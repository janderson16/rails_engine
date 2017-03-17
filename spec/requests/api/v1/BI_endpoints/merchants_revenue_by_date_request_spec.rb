require 'rails_helper'

describe ".revenue_by_date" do
  it "returns revenue across all transactions on specific date" do
    date = "2012-03-16 11:55:05"
    merch_1 = Merchant.create!(name: "Merchant 1")
    merch_2 = Merchant.create!(name: "Merchant 2")
    customer = Customer.create!(first_name: "Joe", last_name: "Schmo")
    item_1 = Item.create!(name: "thing", unit_price: 701, merchant_id: merch_1.id)
    item_2 = Item.create!(name: "thing2", unit_price: 201, merchant_id: merch_2.id)
    invoice_1 = Invoice.create!(merchant_id: merch_1.id, customer_id: customer.id, created_at: "2012-03-16T03:04:05.000Z")
    invoice_2 = Invoice.create!(merchant_id: merch_2.id, customer_id: customer.id, created_at: "2012-03-16T03:03:07.000Z")
    invoice_3 = Invoice.create!(merchant_id: merch_2.id, customer_id: customer.id, created_at: "2012-03-18T03:04:10.000Z")
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 2, item_id: item_1.id, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_2.id, quantity: 1, item_id: item_2.id, unit_price: item_2.unit_price)
    invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_3.id, quantity: 1, item_id: item_2.id, unit_price: item_2.unit_price)
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, result: "success")
    transaction_3 = Transaction.create!(invoice_id: invoice_3.id, result: "success")

    get "/api/v1/merchants/revenue?date=#{date}"

    expect(response).to be_success
    revenue = JSON.parse(response.body)

    expect(revenue).to eq({"total_revenue" => "9.02"})
  end
end
