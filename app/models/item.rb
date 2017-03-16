class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  # def self.most_revenue(count)
  #   joins(:transactions, :invoice_items)
  #   .where(transactions: {result: "success"})
  #   .group(:id).order("sum(quantity * unit_price) DESC")
  #   .limit(count)
  # end
end
