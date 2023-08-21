module UsersHelper
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?=s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def is_admin?(user)
    return (user.admin?)
  end

  def get_users_products(cart)
    products = []
    cart.order_products.each do |order_product|
      products.push(Product.find(order_product.product_id))
    end
    
    return products
  end

  def compute_cart_total(cart)
    total = 0.0
    cart.order_products.each do |order_product|
      product = Product.find(order_product.product_id)
      total = total + (product.price * order_product.quantity)
    end
    
    return total
  end

  def compute_quantities(cart)
    quantities = []
    cart.order_products.each do |order_product|
      quantities[order_product.product_id] = order_product.quantity
    end

    return quantities
  end

  def update_quantities(cart, product_id)
    quantities = []
    cart.order_products.each do |order_product|
      if order_product.product_id == product_id
        order_product.quantity = order_product.quantity - 1
      end
      quantities[order_product.product_id] = order_product.quantity
    end

    return quantities
  end

  def get_order_products(order)
    products = []
    order.order_products.each do |order_product|
      products.push(Product.find(order_product.product_id))
    end

    return products
  end
end
