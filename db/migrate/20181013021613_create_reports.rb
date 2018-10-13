class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
