class CreateProjectComments < ActiveRecord::Migration[5.1]
  def change
    create_table :project_comments do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
