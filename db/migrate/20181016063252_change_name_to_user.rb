class ChangeNameToUser < ActiveRecord::Migration[5.1]
  def up
    change_column :projects, :deadline, :datetime, null: false
  end

  def down
    change_column :projects, :deadline, :time, null: false
  end
end
