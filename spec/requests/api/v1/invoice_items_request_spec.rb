require 'rails_helper'

describe "invoice tems API" do
  it "sends a list of invoice items" do
     create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

  it "can get one invoice item by its id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)

  end

  it 'can find all invoice items by id' do
    invoice_items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?#{invoice_items.first.id}"

    parsed = JSON.parse(response.body)
byebug

    expect(response).to be_success
    expect(parsed.count).to eq(1)

  end


end
