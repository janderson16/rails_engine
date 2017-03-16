describe ".favorite_customer" do
  it "returns customer with most transactions" do
    merch_1 = Merchant.create(name: "Merchant 1")
    customer_1 = Customer.create(first_name: "Joe", last_name: "Schmo")
    customer_2 = Customer.create(first_name: "Jon", last_name: "Schlomo")

    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merch_1.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merch_1.id)
    invoice_3 = Invoice.create(customer_id: customer_2.id, merchant_id: merch_1.id)

    transaction_1 = Transaction.create(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create(invoice_id: invoice_2.id, result: "success")
    transaction_3 = Transaction.create(invoice_id: invoice_3.id, result: "success")


    get "/api/v1/merchants/#{merch_1.id}/favorite_customer"

    expect(response).to be_success
    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq("Jon")
  end
end
