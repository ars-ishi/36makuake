class Course < ApplicationRecord
  belongs_to :project
  has_many   :course_images, dependent: :destroy
  has_many   :course_questions, dependent: :destroy
  has_many   :order_details
end
