class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :integer, default: 1, null: false
    add_column :users, :name, :string, index: true, null: false
    add_column :users, :image, :string
    add_column :users, :url, :string
    add_column :users, :location, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :birth_isvalid, :boolean, default: false
    add_column :users, :gender, :integer
    add_column :users, :gender_isvalid, :boolean, default: false
    add_column :users, :introduction, :text
    add_column :users, :admission, :boolean, default: true
    add_column :users, :news_isvalid, :boolean, default: false
    add_column :users, :report_isvalid, :boolean, default: false
    add_column :users, :tag_isvalid, :boolean, default: false
  end
end
