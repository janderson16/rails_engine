require 'rails_helper'

describe "Merchant API" do
  it "sends a list of invoices for a given merchant" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    customer_2 = Customer.create(first_name: "Jon", last_name: "Schlomo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merch_1.id)


    get "/api/v1/merchants/#{merch_1.id}/invoices"

    expect(response).to be_success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(2)
    expect(invoices.first["customer_id"]).to eq(customer_1.id)

  end
end
