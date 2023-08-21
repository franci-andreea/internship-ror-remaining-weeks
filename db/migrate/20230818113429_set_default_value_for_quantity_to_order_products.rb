class SetDefaultValueForQuantityToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :order_products, :quantity, :integer, :default => 0
  end
end
