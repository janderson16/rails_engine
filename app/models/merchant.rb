class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  # def revenue
  #   byebug
  # end

  def self.most_items(count)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id).order("sum(quantity) DESC")
    .limit(count)
  end

  def self.most_revenue(count)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id).order("sum(quantity * unit_price) DESC")
    .limit(count)
  end

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.success)
    .group(:id).order('count(transactions) DESC').first
  end

# BOSS MODE
  # def customers_with_pending_invoices
  #   # byebug
  #   .find_by_sql("SELECT customers.* FROM customers
  #   JOIN invoices ON customer.id")
  #   customers.joins(:transactions)
  #   .where(transactions: {result: "failed"})
  #   .group(:id)
  #   # byebug
  # end
end
