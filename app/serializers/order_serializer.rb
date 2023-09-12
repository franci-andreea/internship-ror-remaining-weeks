class OrderSerializer < ApplicationSerializer
  attributes :id, :total, :status, :is_cart
end
