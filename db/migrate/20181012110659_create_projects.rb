class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.text :summary
      t.text :content, null: false
      t.integer :support_type, null: false, default: 1
      t.time :deadline, null: false
      t.integer :target_sales, null: false, default: 1
      t.integer :total_sales, null: false, default: 0
      t.timestamps
    end
  end
end
