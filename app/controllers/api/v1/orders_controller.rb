class Api::V1::OrdersController < Api::V1::BaseController
  include OrdersHelper
  before_action :authorize_request
  before_action :has_role_user?, only: [:add_to_cart]
  before_action :has_role_admin?, only: [:mark_order, :index]

  def index
    orders = Order.in_order_of(:status, [0, 1])

    render json: OrderSerializer.new(orders).serialize, status: :ok
  end

  def add_to_cart
    @user = User.find(params[:id])
    @product = Product.find(params[:product_id])

    # check if a cart with this user id already exists
    if get_cart(@user).nil?
      # there is no cart, create a new one
      cart = create_cart(@user)
      if cart.save
        puts "Successfully created the cart!"
      end
    else
      # if it does, then add the product to that one
      cart = get_cart(@user)
    end
    
    add_product_to_cart(cart, @product, params[:quantity])
    
    render json: ProductSerializer.new(cart.products).serialize, status: :ok
  end

  def create_order
    cart_id = params[:cart_id].to_i
    user_id = params[:user_id].to_i
    total = params[:total].to_f

    new_order = Order.find_by("id = ? AND is_cart = ?", cart_id, true)

    if new_order.update(total: total, is_cart: false)
      render json: OrderSerializer.new(new_order)
    else
      render json: { error: "unprocessable_entity" }, status: :unprocessable_entity
    end
  end

  def mark_order
    order = Order.find(params[:order_id].to_i)
    order.update(status: 1)

    render json: OrderSerializer.new(order).serialize, status: :ok
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
