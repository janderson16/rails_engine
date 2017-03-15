class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def formatted_create
    created_at.iso8601(3)
  end

  def formatted_update
    updated_at.iso8601(3)
  end
end
