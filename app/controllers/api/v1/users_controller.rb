class Api::V1::UsersController < Api::V1::BaseController
  include UsersHelper
  before_action :authorize_request, except: :create
  before_action :has_role_user?, only: [:show_carts]
  before_action :has_role_admin?, only: :index

  def index
    users = User.all

    render json: UserSerializer.new(users).serialize, status: :ok
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @signup = true
    @user = User.new
  end

  def create
    user = User.create!(user_params)

    render json: UserSerializer.new(user).serialize, status: :created
  rescue ActiveRecord::RecordNotSaved
    render json: { error: "unprocessable_entity" }, status: :unprocessable_entity
  end

  def show_cart
    @user = User.find(params[:id])
    cart = Order.find_by("user_id = ? AND is_cart = ?", @user.id, true)
    
    if !cart.nil?
      render json: ProductSerializer.new(cart.products).serialize, status: :ok
    else
      head :no_content
    end
  end

  def remove_from_cart
    cart = Order.find(params[:cart_id])
    product_id = params[:product_id].to_i
    @quantities = update_quantities(cart, product_id)
    @order_product = cart.order_products.find_by("product_id = ?", product_id)

    if @quantities[product_id] == 0
      cart.order_products.destroy(@order_product)
    else
      @order_product.update(quantity: @quantities[product_id])
    end

    render json: ProductSerializer.new(cart.products).serialize, status: :ok
  end

  def show_orders
    @user = User.find(params[:id])
    @orders = Order.where("user_id = ?", params[:id])
  end

  def show_order_details
    @order = Order.find(params[:order_id])

    @products = get_order_products(@order)
    @total = compute_cart_total(@order)
    @quantities = compute_quantities(@order)
  end

  def make_admin
    @user = User.find(params[:user_id].to_i)

    if @user.update_attribute(:role, 1)
      redirect_to users_path
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
