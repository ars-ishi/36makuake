class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :order_quantity, null: false
      t.integer :unit_price, null: false
      t.string :shipping_date
      t.timestamps
    end
  end
end
