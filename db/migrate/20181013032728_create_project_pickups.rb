class CreateProjectPickups < ActiveRecord::Migration[5.1]
  def change
    create_table :project_pickups do |t|
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
