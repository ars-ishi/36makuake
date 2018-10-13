class CreateProjectCommentResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :project_comment_responses do |t|
      t.references :project_comment, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
