require 'rails_helper'

describe "Transactions API" do
  it "sends the invoice associated with a given transaction" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)
    transaction_1 = Transaction.create(credit_card_number: "4580251236515201", invoice_id: invoice_1.id, result: "success")

    get "/api/v1/transactions/#{transaction_1.id}/invoice"

    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["customer_id"]).to eq(customer_1.id)
  end
end
