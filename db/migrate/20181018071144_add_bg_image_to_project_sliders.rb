class AddBgImageToProjectSliders < ActiveRecord::Migration[5.1]
  def up
    add_column :project_sliders, :bg_image, :string
  end

  def down
    remove_column :project_sliders, :bg_image, :string
  end
end
