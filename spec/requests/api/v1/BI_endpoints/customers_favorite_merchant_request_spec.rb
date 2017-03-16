describe ".favorite_customer" do
  it "returns customer with most transactions" do
    customer_1 = Customer.create!(first_name: "Joe", last_name: "Schmo")
    merch_1 = Merchant.create!(name: "Merchant 1")
    merch_2 = Merchant.create!(name: "Merchant 2")

    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merch_1.id)
    invoice_2 = Invoice.create!(customer_id: customer_1.id, merchant_id: merch_2.id)
    invoice_3 = Invoice.create!(customer_id: customer_1.id, merchant_id: merch_2.id)

    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, result: "success")
    transaction_3 = Transaction.create!(invoice_id: invoice_3.id, result: "success")


    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq("Merchant 2")
  end
end
