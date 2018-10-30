class CourseQuestion < ApplicationRecord
  belongs_to :course
  has_many :course_question_answers, dependent: :destroy

  accepts_nested_attributes_for :course_question_answers, reject_if: :reject_course_question_answers

  def reject_course_question_answers(attributed)
    attributed['content'].blank?
  end

end
