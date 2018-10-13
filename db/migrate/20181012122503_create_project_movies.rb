class CreateProjectMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :project_movies do |t|
      t.references :project, null: false, foreign_key: true
      t.string :movie
      t.timestamps
    end
  end
end
