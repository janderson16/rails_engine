class Item < ApplicationRecord
  belongs_to :merchant, optional: true

  def formatted_create
    created_at.iso8601(3)
  end

  def formatted_update

  end
end
