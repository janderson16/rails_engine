require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(id)
  end

  it "can find multiple invoices" do
    invoices = create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?id=#{invoices[0].id}"

    expect(response).to be_success
    invoices_response = JSON.parse(response.body)
    expect(invoices_response.first["id"]).to eq(invoices[0].id)
  end

  it "can find a random invoice" do
    create(:invoice)
    create(:invoice)


    get "/api/v1/invoices/random"

    expect(response).to be_success
  end

end