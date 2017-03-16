require 'rails_helper'

describe 'items API' do
  it "returns a collection of merchants for an item" do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)

    get "/api/v1/items/#{item1.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
  end
end