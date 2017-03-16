require 'rails_helper'

describe ".most_revenue" do
  it "ranks items by revenue greatest to least" do
    items = Item.all
    merch_1 = Merchant.create!(name: "Merchant 1")
    merch_2 = Merchant.create!(name: "Merchant 2")
    item_1 = Item.create!(name: "thing", unit_price: 100, merchant_id: merch_1.id)
    item_2 = Item.create!(name: "thing2", unit_price: 200, merchant_id: merch_1.id)
    item_3 = Item.create!(name: "thing3", unit_price: 700, merchant_id: merch_2.id)
    customer = Customer.create!(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create!(merchant_id: merch_1.id, customer_id: customer.id)
    invoice_2 = Invoice.create!(merchant_id: merch_2.id, customer_id: customer.id)
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 1, item_id: item_1.id, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 2, item_id: item_2.id, unit_price: item_2.unit_price)
    invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_2.id, quantity: 6, item_id: item_3.id, unit_price: item_3.unit_price)
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, result: "success")


    get '/api/v1/items/most_revenue?quantity=3'

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.first['name']).to eq("thing3")
  end
end
