class CourseImage < ApplicationRecord
  belongs_to :course

  mount_uploader :image, CourseImageUploader
end
