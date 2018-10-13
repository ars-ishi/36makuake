class CreateOrderAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_answers do |t|
      t.references :order_detail, null: false, foreign_key: true
      t.references :course_question, null: false, foreign_key: true
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
end
