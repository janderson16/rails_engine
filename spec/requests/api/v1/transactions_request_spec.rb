require 'rails_helper'

describe "Transactions API " do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can find a transaction by credit card number" do
    credit_card_number = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq(credit_card_number)
  end

  # it "can find a transaction by created date" do
  #   created = create(:transaction, created_at: "2012-03-17T03:04:05.000Z")
  #   get "/api/v1/transactions/find?created_at=#{created.created_at}"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction["created_at"]).to eq("2012-03-17T03:04:05.000Z")
  # end

  # it "can find a transaction by updated date" do
  #   updated = create(:transaction, updated_at: "2012-03-17T03:04:05.000Z")
  #   get "/api/v1/transactions/find?updated_at=#{updated.updated_at}"
  #
  #   transaction = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(transaction["updated_at"]).to eq("2012-03-17T03:04:05.000Z")
  # end

  it "can find all transactions by credit_card_number" do
    transaction_1 = Transaction.create(credit_card_number: "4654405418249632")
    transaction_2 = Transaction.create(credit_card_number: "4654405418249632")
    transaction_3 = Transaction.create(credit_card_number: "4654405418249633")

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number}"

    transactions = JSON.parse(response.body)


    expect(response).to be_success
    expect(transactions[1]["credit_card_number"]).to eq("4654405418249632")
  end

  it "can find all transactions by created date" do
    transaction_1 = Transaction.create(created_at: "2012-03-17T03:04:05.000Z")
    transaction_2 = Transaction.create(created_at: "2012-03-17T03:04:05.000Z")
    transaction_3 = Transaction.create(created_at: "2012-03-17T03:04:06.000Z")

    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions[1]["credit_card_number"]).to eq(transaction_1.credit_card_number)
  end

  it "can find all transactions by updated date" do
    transaction_1 = Transaction.create(updated_at: "2012-03-17T03:04:05.000Z")
    transaction_2 = Transaction.create(updated_at: "2012-03-17T03:04:05.000Z")
    transaction_3 = Transaction.create(updated_at: "2012-03-17T03:04:06.000Z")
    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"

    transactions = JSON.parse(response.body)


    expect(response).to be_success
    expect(transactions[1]["credit_card_number"]).to eq(transaction_1.credit_card_number)
  end
end
