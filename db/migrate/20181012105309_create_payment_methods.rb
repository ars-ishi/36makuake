class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :credit_card, default: false
      t.boolean :convenience, default: false
      t.boolean :bank, default: false
      t.boolean :net_bank, default: false
      t.timestamps
    end
  end
end
