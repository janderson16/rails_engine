class Customer < ApplicationRecord
  has_many :invoices

  def formatted_create
    created_at.iso8601(3)
  end

  def formatted_update
    updated_at.iso8601(3)
  end
end
