require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoices" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)

    transaction_1 = Transaction.create(credit_card_number: "4580251236515201", invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create(credit_card_number: "4580251236515202",invoice_id: invoice_1.id, result: "success")
    transaction_3 = Transaction.create(credit_card_number: "4580251236515203",invoice_id: invoice_1.id, result: "success")


    get "/api/v1/invoices/#{invoice_1.id}/transactions"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end
end
