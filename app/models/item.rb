class Item < ApplicationRecord
  belongs_to :merchant, optional: true
end
