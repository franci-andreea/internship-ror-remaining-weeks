class SetDefaultValueForQuantityToOneToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :order_products, :quantity, :integer, :default => 1
  end
end
