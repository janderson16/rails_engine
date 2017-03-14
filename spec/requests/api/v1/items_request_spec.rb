require 'rails_helper'

describe "Items API " do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can find an item by name" do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

  it "can find an item by created date" do
    created = create(:item).formatted_create
    get "/api/v1/items/find?created_at=#{created}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["created_at"]).to eq(created)
  end

end
