require 'rails_helper'

describe "Items API " do
  it "loads a list of items" do
    merchant = Merchant.create(name: "TestMerchant")
    create_list(:item, 3, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_success
    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "loads an individual item" do
    merchant = Merchant.create(name: "TestMerchant")
    Item.create!(id: 1492, name: "item1", description: "Good item", unit_price: 22595, merchant_id: merchant.id)

    get "/api/v1/items/#{1492}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["unit_price"]).to eq("225.95")
  end

  it "can get one item by its id" do
    merchant = Merchant.create(name: "TestMerchant")
    id = create(:item, merchant_id: merchant.id).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can get all items by id" do
    merchant = Merchant.create(name: "TestMerchant")
    item = Item.create!(id:1492, merchant_id: merchant.id)
    id = item.id
    get "/api/v1/items/find_all?id=#{id}"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(1)
    expect(items[0]["id"]).to eq(id)
  end

  it "can find an item by name" do
    merchant = Merchant.create(name: "TestMerchant")
    name = create(:item, merchant_id: merchant.id).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

    it "can find an item by unit price" do
    merchant = Merchant.create(name: "TestMerchant")
    price = create(:item, unit_price: 75107, merchant_id: merchant.id).unit_price

    get "/api/v1/items/find?unit_price=#{price}"

    item = JSON.parse(response.body)

    expect(response).to be_success

    expect(item["unit_price"]).to eq("751.07")
  end

  it "can find an item by created date" do
    merchant = Merchant.create(name: "TestMerchant")
    created = create(:item, merchant_id: merchant.id, created_at: "2013-03-17T03:04:05.000Z")
    get "/api/v1/items/find?created_at=#{created.created_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(created.name)
  end

  it "can find an item by updated date" do
    merchant = Merchant.create(name: "TestMerchant")
    updated = create(:item, merchant_id: merchant.id, updated_at: "2013-03-17T03:04:05.000Z")
    get "/api/v1/items/find?updated_at=#{updated.updated_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(updated.name)
  end

  it "can find a random item" do
    create(:item)
    create(:item)

    get "/api/v1/items/random"

    expect(response).to be_success
  end

end
