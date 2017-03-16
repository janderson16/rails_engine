require 'rails_helper'

describe "Invoice API" do
  it "sends the merchant associated with a given invoice" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)

    get "/api/v1/invoices/#{invoice_1.id}/merchant"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq("Merchant 1")
  end
end
