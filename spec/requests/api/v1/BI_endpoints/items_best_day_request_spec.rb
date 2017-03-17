require 'rails_helper'

describe ".items" do
  it 'can find best day of sales for an item' do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
    create(:invoice_item, item: item, invoice: invoice_1, quantity: 7)
    create(:invoice_item, item: item, invoice: invoice_2, quantity: 11)
    create(:invoice_item, item: item, invoice: invoice_3, quantity: 9)

    get "/api/v1/items/#{item.id}/best_day"

    result = JSON.parse(response.body)

    expect(response).to be_success
  end
end