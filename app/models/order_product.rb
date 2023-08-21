class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates_numericality_of :quantity, greater_than_or_equal_to: 1
end
