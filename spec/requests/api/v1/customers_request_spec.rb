require 'rails_helper'

describe "customers API " do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find a customer by first name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end

  it "can find a customer by last name" do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(last_name)
  end

  it "can find a customer by created date" do
    created = create(:customer).formatted_create
    get "/api/v1/customers/find?created_at=#{created}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["created_at"]).to eq(created)
  end

  it "can find a customer by updated date" do
    updated = create(:customer).formatted_update
    get "/api/v1/customers/find?updated_at=#{updated}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["updated_at"]).to eq(updated)
  end

end
