class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :payment_price
      t.text :send_address
      t.integer :payment
      t.timestamps
    end
  end
end
