class Merchant < ApplicationRecord
  has_many :items

  def formatted_create
    created_at.iso8601(3)
  end

  def formatted_update
    updated_at.iso8601(3)
  end
end
