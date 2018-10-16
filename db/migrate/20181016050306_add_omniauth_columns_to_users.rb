class AddOmniauthColumnsToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
  end

  def down
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
  end
end
