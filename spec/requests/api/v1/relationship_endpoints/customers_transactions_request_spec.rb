require 'rails_helper'

describe 'items API' do
  it "returns transactions for a customer" do
    customer = create(:customer)
    invoice1 = create(:invoice, customer_id: customer.id)
    invoice2 = create(:invoice, customer_id: customer.id)
    transaction1 = Transaction.create(credit_card_number: "4580251236515201", invoice_id: invoice1.id, result: "success")
    transaction2 = Transaction.create(credit_card_number: "4580251236515201", invoice_id: invoice2.id, result: "success")




    get "/api/v1/customers/#{customer.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    
  end
end
