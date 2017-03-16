require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoice items for given invoice" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)
    item_1 = Item.create!(name: "thing", unit_price: 700, merchant_id: merch_1.id)
    item_2 = Item.create!(name: "thing2", unit_price: 200, merchant_id: merch_1.id)
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 2, item_id: item_1.id, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 1, item_id: item_2.id, unit_price: item_2.unit_price)


    get "/api/v1/invoices/#{invoice_1.id}/invoice_items"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(2)
  end
end
