class AddDefaultToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :name, :string, index: true, null: false, default: 'user_name'
  end
end
