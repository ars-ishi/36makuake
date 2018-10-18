class AddThumbnailToProjects < ActiveRecord::Migration[5.1]
  def up
    add_column :projects, :thumbnail, :string
  end

  def down
    remove_column :projects, :thumbnail, :string
  end
end
