class CreateReportImages < ActiveRecord::Migration[5.1]
  def change
    create_table :report_images do |t|
      t.references :report, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
