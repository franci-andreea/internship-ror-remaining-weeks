class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :vegetarian
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
