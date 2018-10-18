class CourseQuestion < ApplicationRecord
  belongs_to :course
  has_many :course_question_answers, dependent: :destroy
end
