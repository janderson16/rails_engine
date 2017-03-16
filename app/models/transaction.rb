class Transaction < ApplicationRecord
  belongs_to :invoice, optional: true
  scope :success, -> {where(result: 'success')}
end
