require 'rails_helper'

describe 'items API' do
  it "returns a merchant for an item" do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)



    get "/api/v1/items/#{item1.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end

  it "returns an invoice item for an item" do
    merchant = create(:merchant)
    invoice = create(:invoice)
    item1= create(:item, merchant_id: merchant.id)
    item2= create(:item, merchant_id: merchant.id)
    invoice_item1 = InvoiceItem.create(invoice_id: invoice.id, quantity: 2, item_id: item1.id, unit_price: item1.unit_price )

    get "/api/v1/items/#{item1.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(item1.invoice_items.count)
    expect(invoice_item1.item_id).to eq(item1.id)
  end
end