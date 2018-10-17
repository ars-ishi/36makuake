class ChangeColumnDefaultNameOfUser < ActiveRecord::Migration[5.1]
  def up
    change_column_default :users, :name, nil
    change_column :users, :name, :string, index: true, null: true
  end

  def down
    change_column_default :users, :name, 'user_name'
    change_column :users, :name, :string, index: true, null: false
  end
end
