class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  has_many :customers, through: :invoices
  has_many :merchants, through: :invoices
end
