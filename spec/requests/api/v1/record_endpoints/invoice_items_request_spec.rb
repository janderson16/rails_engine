require 'rails_helper'

describe "invoice tems API" do
  it "sends a list of invoice items" do
    merchant = Merchant.create(name: "TestMerchant")
    item_1 = Item.create(name: "Test Item", merchant_id: merchant.id)
    item_2 = Item.create(name: "Test Item", merchant_id: merchant.id)
    customer = Customer.create(first_name: "Tom", last_name: "Jones")
    invoice = Invoice.create(merchant_id: merchant.id, customer_id: customer.id)
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice.id)
    invoice_item_2 = InvoiceItem.create(item_id: item_2.id, invoice_id: invoice.id)


    get "/api/v1/invoice_items"

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
  end

  it "can get one invoice item by its id" do
    merchant = Merchant.create(name: "TestMerchant")
    item_1 = Item.create(name: "Test Item", merchant_id: merchant.id)
    customer = Customer.create(first_name: "Tom", last_name: "Jones")
    invoice = Invoice.create(merchant_id: merchant.id, customer_id: customer.id)
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice.id)


    get "/api/v1/invoice_items/#{invoice_item_1.id}"

    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item["item_id"]).to eq(item_1.id)

  end

  it 'can find all invoice items by id' do
    merchant = Merchant.create(name: "TestMerchant")
    item_1 = Item.create(name: "Test Item", merchant_id: merchant.id)
    item_2 = Item.create(name: "Test Item", merchant_id: merchant.id)
    customer = Customer.create(first_name: "Tom", last_name: "Jones")
    invoice = Invoice.create(merchant_id: merchant.id, customer_id: customer.id)
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice.id)
    invoice_item_2 = InvoiceItem.create(item_id: item_2.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?#{invoice_item_1.id}"

    parsed = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed.count).to eq(2)

  end


end
