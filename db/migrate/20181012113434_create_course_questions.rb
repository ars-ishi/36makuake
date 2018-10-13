class CreateCourseQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :course_questions do |t|
      t.references :course, null: false, foreign_key: true
      t.string :content
      t.boolean :usable, default: true
      t.timestamps
    end
  end
end
