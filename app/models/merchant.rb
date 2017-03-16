class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(count)
    joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .group(:id).order("sum(quantity * unit_price) DESC")
    .limit(count)
  end

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.success)
    .group(:id).order('count(transactions) DESC').first
  end

end
