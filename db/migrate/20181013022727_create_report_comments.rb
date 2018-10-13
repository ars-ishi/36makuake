class CreateReportComments < ActiveRecord::Migration[5.1]
  def change
    create_table :report_comments do |t|
      t.references :report, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
