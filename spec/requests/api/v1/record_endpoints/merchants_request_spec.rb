require 'rails_helper'

describe "Merchants API " do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find a merchant by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "can find a merchant by created date" do
    created = create(:merchant, created_at: "2012-03-17T03:04:05.000Z")
    get "/api/v1/merchants/find?created_at=#{created.created_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(created.name)
  end

  it "can find a merchant by updated date" do
    updated = create(:merchant, updated_at: "2012-03-17T03:04:05.000Z")
    get "/api/v1/merchants/find?updated_at=#{updated.updated_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(updated.name)
  end

  it "can find all merchants by name" do
    merchant_1 = Merchant.create(name: "MyMerchant")
    merchant_2 = Merchant.create(name: "MyMerchant")
    merchant_3 = Merchant.create(name: "NotMyMerchant")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

    merchants = JSON.parse(response.body)


    expect(response).to be_success
    expect(merchants[1]["name"]).to eq("MyMerchant")
  end

  it "can find all merchants by created date" do
    merchant_1 = Merchant.create(created_at: "2012-03-17T03:04:05.000Z")
    merchant_2 = Merchant.create(created_at: "2012-03-17T03:04:05.000Z")
    merchant_3 = Merchant.create(created_at: "2012-03-17T03:04:06.000Z")

    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants[1]["name"]).to eq(merchant_1.name)
  end

  it "can find all merchants by updated date" do
    merchant_1 = Merchant.create(updated_at: "2012-03-17T03:04:05.000Z")
    merchant_2 = Merchant.create(updated_at: "2012-03-17T03:04:05.000Z")
    merchant_3 = Merchant.create(updated_at: "2012-03-17T03:04:06.000Z")

    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants[1]["name"]).to eq(merchant_1.name)
  end

end
