class CreateCourseImages < ActiveRecord::Migration[5.1]
  def change
    create_table :course_images do |t|
      t.references :course, null: false, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
