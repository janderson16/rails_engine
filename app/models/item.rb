class Item < ApplicationRecord

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_items(count)
    joins(invoices: [:transactions])
    .where(transactions: {result: "success"})
    .group(:id).order("sum(quantity) DESC")
    .limit(count)
  end

  def self.most_revenue(count)
    joins(invoices: [:transactions])
    .where(transactions: {result: "success"})
    .group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .limit(count)
  end

  def best_day
    invoices.joins(:invoice_items)
    .group('invoices.id, invoices.created_at')
    .order('sum(invoice_items.quantity) DESC')
    .first
    .created_at
  end
end
