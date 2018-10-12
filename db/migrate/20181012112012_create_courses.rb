class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name, null: false
      t.text :content
      t.integer :price, null: false
      t.string :due_date
      t.integer :stock, null: false
      t.integer :sales_type, null: false, default: 1
      t.timestamps
    end
  end
end
