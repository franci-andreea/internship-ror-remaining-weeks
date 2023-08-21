class HomepageController < ApplicationController
  def index
    @homepage = true

    if logged_in?
      @cart = Order.find_by("user_id = ? AND is_cart = ?", @current_user.id, true)
    end
    
    @products = Product.all

    @products = @products.where("category = ?", Product.categories[params[:category]]) if params[:category].present? && params[:category] != 'none'
    if params[:sorting].present? && params[:sorting] != 'none'
      if params[:sorting] == 'az'
        @products = @products.order(:name)
      elsif params[:sorting] == 'za'
        @products = @products.order(name: :desc)
      elsif params[:sorting] == 'ascending-price'
        @products = @products.order(:price)
      elsif params[:sorting] == 'descending-price'
        @products = @products.order(price: :desc)
      end
    end
    @products = @products.where(vegetarian: (params[:vegetarian_select] == 'vegetarian')) if params[:vegetarian_select].present? && params[:vegetarian_select] != 'none'
 
    @products = @products.where("price >= ? AND price <= ?", params[:min_price].to_i, params[:max_price].to_i) if params[:min_price].present? && params[:max_price].present?
  end

end
