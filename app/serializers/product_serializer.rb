class ProductSerializer < ApplicationSerializer  
  attributes :id, :name, :price, :vegetarian, :category, :description

  attribute :quantity do |product|
    order_product = OrderProduct.find_by(product_id: product.id)
    order_product&.quantity
  end
end
