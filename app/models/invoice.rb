class Invoice < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :merchant
end
