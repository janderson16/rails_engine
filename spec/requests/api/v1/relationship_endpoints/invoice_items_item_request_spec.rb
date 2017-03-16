require 'rails_helper'

describe "Invoice Items API" do
  it "sends the item associated with a given invoice item" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)
    item_1 = Item.create!(name: "thing", unit_price: 701, merchant_id: merch_1.id)
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, quantity: 2, item_id: item_1.id, unit_price: item_1.unit_price)

    get "/api/v1/invoice_items/#{invoice_item_1.id}/item"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["unit_price"]).to eq("7.01")
  end
end
