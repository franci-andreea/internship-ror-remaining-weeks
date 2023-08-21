class AddQuantityToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :quantity, :integer, null: false
  end
end
