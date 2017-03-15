require 'rails_helper'

describe "Items API " do
  it "loads a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "loads an individual item" do
    item1 = Item.create!(id: 1492, name: "item1", description: "Good item", unit_price: 22500)

    get "/api/v1/items/#{1492}"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(item1.unit_price).to eq("225.00")
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can get all items by id" do
    item = Item.create!(id:1492)
    id = item.id
    get "/api/v1/items/find_all?id=#{id}"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(1)
    expect(items[0]["id"]).to eq(id)
  end

  it "can find an item by name" do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

  it "can find an item by created date" do
    created = create(:item, created_at: "2012-03-17T03:04:05.000Z")
    get "/api/v1/items/find?created_at=#{created.created_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["created_at"]).to eq("2012-03-17T03:04:05.000Z")
  end

  it "can find an item by updated date" do
    updated = create(:item, updated_at: "2013-03-17T03:04:05.000Z")
    get "/api/v1/items/find?updated_at=#{updated.updated_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["updated_at"]).to eq("2013-03-17T03:04:05.000Z")
  end

end