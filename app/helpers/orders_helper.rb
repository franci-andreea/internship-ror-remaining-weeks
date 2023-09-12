module OrdersHelper
  def get_cart(user)
    return Order.find_by("user_id = ? AND is_cart = ?", user.id, true)
  end

  def create_cart(user)
    return Order.new(date: Time.now, is_cart: true, status: 0, total: 0, user_id: user.id)
  end

  def add_product_to_cart(cart, product, quantity)
    # verify if the product already exists in the cart
    # if it does, just update the quantity
    if cart.product_ids.include? product.id
      order_product = OrderProduct.find_by(product_id: product.id)
      updated_quantity = order_product.quantity + quantity.to_i
      order_product.update_column(:quantity, updated_quantity)
    else
      # if the product does not exist, add it to the cart and
      # set the quantity to params[:quantity]
      cart.products.push(product)
      cart.order_products.last.update_column(:quantity, quantity.to_i)
    end
  end
  
end
