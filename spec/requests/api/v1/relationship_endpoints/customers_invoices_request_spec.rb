require 'rails_helper'

describe 'items API' do
  it "can return invoices associated with a customer" do
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id)
    invoice2 = create(:invoice, customer_id: customer1.id)

    get "/api/v1/customers/#{customer1.id}/invoices"

    customer_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer_invoices.count).to eq(customer1.invoices.count)
  end
end