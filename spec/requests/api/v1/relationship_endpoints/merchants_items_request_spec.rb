require 'rails_helper'

describe "Merchant API" do
  it "sends a list of items for a given merchant" do
    merch_1 = Merchant.create(name: "Merchant 1")
    item_1 = Item.create!(name: "thing", unit_price: 700, merchant_id: merch_1.id)
    item_2 = Item.create!(name: "thing2", unit_price: 200, merchant_id: merch_1.id)


    get "/api/v1/merchants/#{merch_1.id}/items"

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
    expect(items.first["name"]).to eq("thing")

  end
end
