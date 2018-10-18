class CreateCourseQuestionAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :course_question_answers do |t|
      t.references :course_question, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
