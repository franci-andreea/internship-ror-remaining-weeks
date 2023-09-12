class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authorize_request
  before_action :has_role_admin?, except: :index

  def index
    products = Product.all
    render json: ProductSerializer.new(products).serialize
  end

  def new
    @categories = Product.categories.keys
    @product = Product.new
  end

  def create
    product = Product.create!(product_params)
      
    render json: ProductSerializer.new(product).serialize, status: :created
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Product.categories.keys
  end

  def update
    product = Product.find(params[:id])
    product.update!(product_params)
    
    render json: ProductSerializer.new(product).serialize, status: :ok
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!

    head :ok
  rescue ActiveRecord::RecordNotDestroyed
    render json: { error: 'unprocessable_entity' }, status: :unprocessable_entity
  end

  private
    def product_params
      params.permit(:name, :price, :vegetarian, :category, :description)
    end
end
