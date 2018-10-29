class Course < ApplicationRecord
  belongs_to :project
  has_many   :course_images, dependent: :destroy
  has_many   :course_questions, dependent: :destroy
  has_many   :order_details

  enum sales_type: { is_open: 1, is_close: 2, is_store: 3 }

  accepts_nested_attributes_for :course_images, reject_if: :reject_course_images
  accepts_nested_attributes_for :course_questions, reject_if: :reject_course_questions

  def reject_course_images(attributed)
    attributed['image'].blank?
  end

  def reject_course_questions(attributed)
    attributed['content'].blank?
  end

end
