class CreateSendAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :send_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :main, default: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_ruby, null: false
      t.string :first_name_ruby, null: false
      t.integer :gender
      t.string :industry
      t.integer :birth_year
      t.string :phone_number, null: false
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :house_number, null: false
      t.string :building
      t.timestamps
    end
  end
end
